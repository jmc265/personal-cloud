# Get a list of Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = "${var.oci_tenancy_ocid}"
}

# Output the result
output "show-ads" {
  value = "${data.oci_identity_availability_domains.ads.availability_domains}"
}
