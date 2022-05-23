# https://github.com/billimek/cloudvm
# https://spacelift.io/blog/getting-started-with-terraform-on-google-cloud-platform-gcp
# https://github.com/christippett/terraform-cloudinit-container-server/tree/master
# Firewall --> https://github.com/sethvargo/terraform-gcp-examples/blob/master/public-instance-webserver/main.tf

module "container-server" {
  source  = "christippett/container-server/cloudinit"
  version = "~> 1.2"

  domain = "pluto.${var.root_domain}"
  email  = var.email_address

  files = [
    {
      filename = "docker-compose.yaml"
      content  = filebase64("${path.module}/pluto/docker-compose.yaml")
    }
  ]
  env = {
    TRAEFIK_API_DASHBOARD = false
    DOCKER_APP_DATA       = "/run/app"
    ADMIN_EMAIL           = var.email_address
    ADMIN_PASSWORD        = var.admin_password
    INET_DOMAIN           = "pluto.${var.root_domain}"
  }

  # extra cloud-init config provided to setup + format persistent disk
  cloudinit_part = [{
    content_type = "text/cloud-config"
    content      = local.cloudinit_disk
  }]
}

# prepare persistent disk
locals {
  cloudinit_disk = <<EOT
#cloud-config
bootcmd:
  - fsck.ext4 -tvy /dev/sdb || mkfs.ext4 /dev/sdb
  - mkdir -p /run/app
  - mount -o defaults -t ext4 /dev/sdb /run/app
EOT
}

resource "google_compute_instance" "pluto" {
  name           = "pluto"
  machine_type   = "f1-micro"
  can_ip_forward = "true"
  allow_stopping_for_update = "true"
  tags         = ["ssh", "http-server", "https-server"]

  metadata = {
    user-data = module.container-server.cloud_config
  }

  boot_disk {
    initialize_params {
      type  = "pd-standard"   
      # https://cloud.google.com/compute/docs/images/os-details
      image = data.google_compute_image.cos.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  scheduling {
    automatic_restart = true
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

data "google_compute_image" "cos" {
  project = "cos-cloud"
  family  = "cos-97-lts"
}

/* Disk --------------------------------------------------------------------- */

resource "google_compute_disk" "default" {
  name    = "disk-app-server"
  type    = "pd-standard"
  zone    = "${var.gcp_region}-b"
  size    = 20
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.id
  instance = google_compute_instance.pluto.id
}

/* Firewall --------------------------------------------------------------------- */

resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "https-server" {
  name    = "default-allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}
