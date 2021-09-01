output "devops_logid" {
  value = { for v in oci_logging_log.devops_log : v.display_name => v.id }
}

output "devops_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
