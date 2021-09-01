output "lb_accesslogid" {
  value = { for v in oci_logging_log.lb_access_log : v.display_name => v.id }
}

output "lb_errorlogid" {
  value = { for v in oci_logging_log.lb_error_log : v.display_name => v.id }
}

output "lb_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
