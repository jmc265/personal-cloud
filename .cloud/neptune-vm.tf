# https://www.lightenna.com/tech/2020/create-oracle-cloud-vm-using-terraform/
# https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-compute/01-summary.htm
# https://gfarcas.github.io/blog/03-12-2020-terraform-in-oracle/
# https://github.com/gszathmari/homelab-on-oracle-cloud/blob/main/terraform/compute-x86_64.tf

# resource "oci_core_vcn" "vcn" {
#   cidr_block = "10.1.0.0/16"
#   compartment_id = var.compartment_ocid
#   display_name = "vcn-${var.hostname}"
#   dns_label = "vcn${var.hostname}"
# }

# resource "oci_core_internet_gateway" "internet_gateway" {
#   compartment_id = var.compartment_ocid
#   display_name = "ig-${var.hostname}"
#   vcn_id = oci_core_vcn.vcn.id
# }

# resource "oci_core_default_route_table" "default_route_table" {
#   manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
#   display_name = "rt-${var.hostname}"

#   route_rules {
#     destination = "0.0.0.0/0"
#     destination_type = "CIDR_BLOCK"
#     network_entity_id = oci_core_internet_gateway.internet_gateway.id
#   }
# }

# resource "oci_core_network_security_group_security_rule" "nsg_outbound" {
#   network_security_group_id = "${oci_core_network_security_group.nsg.id}"
#   direction = "EGRESS"
#   protocol = "all"
#   description = "nsg-${var.hostname}-outbound"
#   destination = "0.0.0.0/0"
#   destination_type = "CIDR_BLOCK"
# }

# resource "oci_core_subnet" "subnet" {
#   availability_domain = data.oci_identity_availability_domain.ad.name
#   cidr_block = "10.1.0.0/24"
#   display_name = "subnet-${var.hostname}"
#   dns_label = "subnet${var.hostname}"
#   security_list_ids = [
#     oci_core_security_list.empty_security_list.id]
#   compartment_id = var.compartment_ocid
#   vcn_id = oci_core_vcn.vcn.id
#   route_table_id = oci_core_vcn.vcn.default_route_table_id
#   dhcp_options_id = oci_core_vcn.vcn.default_dhcp_options_id
# }

# resource "oci_core_security_list" "empty_security_list" {
#   compartment_id = var.compartment_ocid
#   vcn_id = oci_core_vcn.vcn.id
#   display_name = "seclist-${var.hostname}"
# }

# resource "oci_core_network_security_group" "nsg" {
#   compartment_id = var.compartment_ocid
#   vcn_id = oci_core_vcn.vcn.id
#   display_name = "nsg-${var.hostname}"
# }

# resource "oci_core_network_security_group_security_rule" "nsg_inbound_ssh" {
#   network_security_group_id = "${oci_core_network_security_group.nsg.id}"
#   direction = "INGRESS"
#   protocol = "6" # TCP
#   description = "nsg-${var.hostname}-inbound-ssh"
#   source = "${data.dns_a_record_set.bastion-host.addrs[0]}/32"
#   source_type = "CIDR_BLOCK"
#   destination = "${module.vminst.public_ip}/32"
#   destination_type = "CIDR_BLOCK"
#   tcp_options {
#     destination_port_range {
#       min = 22
#       max = 22
#     }
#   }
# }


# resource "oci_core_instance" "neptune" {
#     #Required
#     availability_domain = var.instance_availability_domain
#     compartment_id = var.compartment_id
#     shape = var.instance_shape

#     #Optional
#     agent_config {

#         #Optional
#         are_all_plugins_disabled = var.instance_agent_config_are_all_plugins_disabled
#         is_management_disabled = var.instance_agent_config_is_management_disabled
#         is_monitoring_disabled = var.instance_agent_config_is_monitoring_disabled
#         plugins_config {
#             #Required
#             desired_state = var.instance_agent_config_plugins_config_desired_state
#             name = var.instance_agent_config_plugins_config_name
#         }
#     }
#     availability_config {

#         #Optional
#         is_live_migration_preferred = var.instance_availability_config_is_live_migration_preferred
#         recovery_action = var.instance_availability_config_recovery_action
#     }
#     create_vnic_details {

#         #Optional
#         assign_private_dns_record = var.instance_create_vnic_details_assign_private_dns_record
#         assign_public_ip = var.instance_create_vnic_details_assign_public_ip
#         defined_tags = {"Operations.CostCenter"= "42"}
#         display_name = var.instance_create_vnic_details_display_name
#         freeform_tags = {"Department"= "Finance"}
#         hostname_label = var.instance_create_vnic_details_hostname_label
#         nsg_ids = var.instance_create_vnic_details_nsg_ids
#         private_ip = var.instance_create_vnic_details_private_ip
#         skip_source_dest_check = var.instance_create_vnic_details_skip_source_dest_check
#         subnet_id = oci_core_subnet.test_subnet.id
#         vlan_id = oci_core_vlan.test_vlan.id
#     }
#     dedicated_vm_host_id = oci_core_dedicated_vm_host.test_dedicated_vm_host.id
#     defined_tags = {"Operations.CostCenter"= "42"}
#     display_name = var.instance_display_name
#     extended_metadata = {
#         some_string = "stringA"
#         nested_object = "{\"some_string\": \"stringB\", \"object\": {\"some_string\": \"stringC\"}}"
#     }
#     fault_domain = var.instance_fault_domain
#     freeform_tags = {"Department"= "Finance"}
#     hostname_label = var.instance_hostname_label
#     instance_options {

#         #Optional
#         are_legacy_imds_endpoints_disabled = var.instance_instance_options_are_legacy_imds_endpoints_disabled
#     }
#     ipxe_script = var.instance_ipxe_script
#     is_pv_encryption_in_transit_enabled = var.instance_is_pv_encryption_in_transit_enabled
#     launch_options {

#         #Optional
#         boot_volume_type = var.instance_launch_options_boot_volume_type
#         firmware = var.instance_launch_options_firmware
#         is_consistent_volume_naming_enabled = var.instance_launch_options_is_consistent_volume_naming_enabled
#         is_pv_encryption_in_transit_enabled = var.instance_launch_options_is_pv_encryption_in_transit_enabled
#         network_type = var.instance_launch_options_network_type
#         remote_data_volume_type = var.instance_launch_options_remote_data_volume_type
#     }
#     metadata = var.instance_metadata
#     platform_config {
#         #Required
#         type = var.instance_platform_config_type

#         #Optional
#         is_measured_boot_enabled = var.instance_platform_config_is_measured_boot_enabled
#         is_secure_boot_enabled = var.instance_platform_config_is_secure_boot_enabled
#         is_trusted_platform_module_enabled = var.instance_platform_config_is_trusted_platform_module_enabled
#         numa_nodes_per_socket = var.instance_platform_config_numa_nodes_per_socket
#     }
#     preemptible_instance_config {
#         #Required
#         preemption_action {
#             #Required
#             type = var.instance_preemptible_instance_config_preemption_action_type

#             #Optional
#             preserve_boot_volume = var.instance_preemptible_instance_config_preemption_action_preserve_boot_volume
#         }
#     }
#     shape_config {

#         #Optional
#         baseline_ocpu_utilization = var.instance_shape_config_baseline_ocpu_utilization
#         memory_in_gbs = var.instance_shape_config_memory_in_gbs
#         nvmes = var.instance_shape_config_nvmes
#         ocpus = var.instance_shape_config_ocpus
#     }
#     source_details {
#         #Required
#         source_id = oci_core_image.test_image.id
#         source_type = "image"

#         #Optional
#         boot_volume_size_in_gbs = var.instance_source_details_boot_volume_size_in_gbs
#         kms_key_id = oci_kms_key.test_key.id
#     }
#     preserve_boot_volume = false
# }

resource "oci_identity_compartment" "neptune" {
  compartment_id = var.oci_tenancy_ocid
  description    = "Compartment for neptune"
  name           = "Neptune"
}

resource "oci_core_vcn" "vcn" {
  cidr_block = "10.1.0.0/16"
  compartment_id = var.oci_tenancy_ocid
  display_name = "vcn-neptune"
  dns_label = "vcnneptune"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.oci_tenancy_ocid
}

resource "oci_core_instance" "neptune" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.neptune.id
    shape = "VM.Standard.E2.1.Micro"
    source_details {
        # https://docs.oracle.com/en-us/iaas/images/image/8c01df73-ce27-42de-8bec-ab99e6447ba9/
        source_id = "ocid1.image.oc1.uk-london-1.aaaaaaaaaikc54jicka6wzs3oeh242nlgwg7mdaczw4a6cjr3qr662j6ekaq"
        source_type = "image"
    }

    # Optional
    display_name = "neptune"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_vcn.vcn.id
    }
    metadata = {
        # ssh_authorized_keys = file("<ssh-public-key-path>")
    } 
    preserve_boot_volume = false
}