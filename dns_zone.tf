resource "azurerm_dns_zone" "cedi_dev_dns" {
  name                = "cedi.dev"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
}

resource "azurerm_dns_txt_record" "txt" {
  name                = "@"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }
  record {
    value = "MS=ms38038929"
  }
  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "autodiscover" {
  name                = "autodiscover"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record              = "autodiscover.outlook.com"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "enterpriseenrollment" {
  name                = "enterpriseenrollment"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record              = "enterpriseenrollment.manage.microsoft.com"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "enterpriseregistration" {
  name                = "enterpriseregistration"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record              = "enterpriseregistration.windows.net"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_mx_record" "outlook_mx" {
  name                = "@"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600

  record {
    preference = 0
    exchange   = "cedi-dev.mail.protection.outlook.com"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "selector1._domainkey" {
  name                = "selector1._domainkey"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record              = "selector1-cedi-dev._domainkey.cedidev.onmicrosoft.com"

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_dns_cname_record" "selector2._domainkey" {
  name                = "selector1._domainkey"
  zone_name           = "${azurerm_dns_zone.cedi_dev_dns.name}"
  resource_group_name = "${azurerm_resource_group.cedi_rg.name}"
  ttl                 = 3600
  record              = "selector2-cedi-dev._domainkey.cedidev.onmicrosoft.com"

  tags = {
    Environment = "Production"
  }
}