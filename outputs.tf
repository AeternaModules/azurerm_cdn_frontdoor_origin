output "cdn_frontdoor_origins_cdn_frontdoor_origin_group_id" {
  description = "Map of cdn_frontdoor_origin_group_id values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.cdn_frontdoor_origin_group_id }
}
output "cdn_frontdoor_origins_certificate_name_check_enabled" {
  description = "Map of certificate_name_check_enabled values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.certificate_name_check_enabled }
}
output "cdn_frontdoor_origins_enabled" {
  description = "Map of enabled values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.enabled }
}
output "cdn_frontdoor_origins_host_name" {
  description = "Map of host_name values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.host_name }
}
output "cdn_frontdoor_origins_http_port" {
  description = "Map of http_port values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.http_port }
}
output "cdn_frontdoor_origins_https_port" {
  description = "Map of https_port values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.https_port }
}
output "cdn_frontdoor_origins_name" {
  description = "Map of name values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.name }
}
output "cdn_frontdoor_origins_origin_host_header" {
  description = "Map of origin_host_header values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.origin_host_header }
}
output "cdn_frontdoor_origins_priority" {
  description = "Map of priority values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.priority }
}
output "cdn_frontdoor_origins_private_link" {
  description = "Map of private_link values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.private_link }
}
output "cdn_frontdoor_origins_weight" {
  description = "Map of weight values across all cdn_frontdoor_origins, keyed the same as var.cdn_frontdoor_origins"
  value       = { for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : k => v.weight }
}

