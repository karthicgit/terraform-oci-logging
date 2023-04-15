data "oci_logging_log_groups" "test_log_groups" {
    for_each = toset(var.existing_loggroup)
    compartment_id = var.compartment_id

    #Optional
    display_name = each.value
    #is_compartment_id_in_subtree = var.log_group_is_compartment_id_in_subtree
}

variable "existing_loggroup" {
  
}

resource "oci_logging_log" "vcn_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = try(var.loggroup[each.value.loggroup].id,data.oci_logging_log_groups.test_log_groups[each.value.loggroup].log_groups.0.id)
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "all"
      resource    = var.vcn_id == "none" ? data.oci_core_subnets.withoutvcn[each.key].subnets.0.id : data.oci_core_subnets.withvcn[each.key].subnets.0.id
      service     = "flowlogs"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

data "oci_core_subnets" "withvcn" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "AVAILABLE"
  vcn_id       = var.vcn_id
}

data "oci_core_subnets" "withoutvcn" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "AVAILABLE"

}
