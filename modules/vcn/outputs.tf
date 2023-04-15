output "vcn_logid" {
  value = { for k, v in oci_logging_log.vcn_log : v.display_name => v.id }
}

output "vcn_loggroupid" {
  value = merge({ for k, v in var.loggroup : v.display_name => v.id },local.output_existingvcnloggroup)
}

locals {
  output_existingvcnloggroup = zipmap(var.existing_loggroup,[for i in var.existing_loggroup : data.oci_logging_log_groups.test_log_groups[i].log_groups.0.id])
}
