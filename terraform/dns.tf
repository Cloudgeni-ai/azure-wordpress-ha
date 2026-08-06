resource "azurerm_dns_zone" "mail_opengeni_ai" {
  name                = "mail.opengeni.ai"
  resource_group_name = "rg-opengeni-dns-neu"

  tags = {
    created     = "2026-06-05"
    environment = "shared"
    managed-by  = "codex"
    owner       = "cloudgeni"
    product     = "opengeni"
    purpose     = "managed-saas-email-domain"
  }
}

import {
  to = azurerm_dns_zone.mail_opengeni_ai
  id = "/subscriptions/b29dff3d-6e8d-4bb9-a8c0-b2d9fef4fef0/resourceGroups/rg-opengeni-dns-neu/providers/Microsoft.Network/dnszones/mail.opengeni.ai"
}