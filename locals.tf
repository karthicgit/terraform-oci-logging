locals {
  apigwlogdef   = { for k, v in var.service_logdef : k => v if v.service == "apigateway" }
  apigwloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "apigateway"],var.existing_loggroup)
  existing_apigwloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "apigateway"],var.existing_loggroup)
  

  devopslogdef   = { for k, v in var.service_logdef : k => v if v.service == "devops" }
  devopsloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "devops"],var.existing_loggroup)
  existing_devopsloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "devops"],var.existing_loggroup)

  emaillogdef   = { for k, v in var.service_logdef : k => v if v.service == "email" }
  emailloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "email"],var.existing_loggroup)
  existing_emailloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "email"],var.existing_loggroup)

  eventlogdef   = { for k, v in var.service_logdef : k => v if v.service == "cloudevents" }
  eventloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "cloudevents"],var.existing_loggroup)
  existing_eventloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "cloudevents"],var.existing_loggroup)

  funclogdef   = { for k, v in var.service_logdef : k => v if v.service == "functions" }
  funcloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "functions"],var.existing_loggroup)
  existing_funcloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "functions"],var.existing_loggroup)

  intlogdef   = { for k, v in var.service_logdef : k => v if v.service == "integration" }
  intloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "integration"],var.existing_loggroup)
  existing_intloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "integration"],var.existing_loggroup)

  lblogdef   = { for k, v in var.service_logdef : k => v if v.service == "loadbalancer" }
  lbloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "loadbalancer"],var.existing_loggroup)
  existing_lbloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "loadbalancer"],var.existing_loggroup)

  medialogdef   = { for k, v in var.service_logdef : k => v if v.service == "mediaflow" }
  medialoggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "mediaflow"],var.existing_loggroup)
  existing_medialoggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "mediaflow"],var.existing_loggroup)

  oslogdef   = { for k, v in var.service_logdef : k => v if v.service == "objectstorage" }
  osloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "objectstorage"],var.existing_loggroup)
  existing_osloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "objectstorage"],var.existing_loggroup)

  vcnlogdef   = { for k, v in var.service_logdef : k => v if v.service == "flowlogs" }
  vcnloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "flowlogs"],var.existing_loggroup)
  existing_vcnloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "flowlogs"],var.existing_loggroup)

  vpnlogdef   = { for k, v in var.service_logdef : k => v if v.service == "vpn" }
  vpnloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "vpn"],var.existing_loggroup)
  existing_vpnloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "vpn"],var.existing_loggroup)

  waflogdef   = { for k, v in var.service_logdef : k => v if v.service == "waf" }
  wafloggroup = setsubtract([for k, v in var.service_logdef : v.loggroup if v.service == "waf"],var.existing_loggroup)
  existing_wafloggroup = setintersection([for k, v in var.service_logdef : v.loggroup if v.service == "waf"],var.existing_loggroup)
}

locals {
  linuxloggroup = setsubtract([for k, v in var.linux_logdef : v.loggroup],var.existing_loggroup)
  existing_linuxloggroup = setintersection([for k, v in var.linux_logdef : v.loggroup],var.existing_loggroup)
  
  winloggroup   = setsubtract([for k, v in var.windows_logdef : v.loggroup],var.existing_loggroup)
  existing_winloggroup   = setintersection([for k, v in var.windows_logdef : v.loggroup],var.existing_loggroup)
}
