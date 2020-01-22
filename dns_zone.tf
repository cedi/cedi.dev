resource "azurerm_dns_zone" "cedi_dev_dns" {
  name                = "cedi.dev"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
}

resource "azurerm_dns_txt_record" "ms_verification_key" {
  name                = ""
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record {
    value = "MS=ms38038929"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_txt_record" "spf_entry" {
  name                = ""
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "autodiscover" {
  name                = "autodiscover"
  zone_name           = "${azurerm_dns_zone.example.name}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  ttl                 = 3600
  record              = "autodiscover.outlook.com"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "enterpriseenrollment" {
  name                = "enterpriseenrollment"
  zone_name           = "${azurerm_dns_zone.example.name}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  ttl                 = 3600
  record              = "enterpriseenrollment.manage.microsoft.com"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "enterpriseregistration" {
  name                = "enterpriseregistration"
  zone_name           = "${azurerm_dns_zone.example.name}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  ttl                 = 3600
  record              = "enterpriseregistration.windows.net"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_mx_record" "outlook_mx" {
  name                = ""
  zone_name           = "${azurerm_dns_zone.example.name}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  ttl                 = 3600

  record {
    preference = 10
    exchange   = "cedi-dev.mail.protection.outlook.com"
  }

  tags = {
    Environment = "Production"
  }
}
