data "oci_functions_applications" "func_apps" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  display_name = each.value.resource
  #id           = oci_functions_application.test_application.id
  #state = "AVAILABLE"
}


resource "oci_logging_log" "function_log" {
  for_each = var.logdefinition

  display_name = each.key
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "invoke"
      resource    = data.oci_functions_applications.func_apps[each.key].applications.0.id
      service     = "functions"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
