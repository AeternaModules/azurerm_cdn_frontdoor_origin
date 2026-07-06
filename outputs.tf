output "cdn_frontdoor_origins" {
  description = "All cdn_frontdoor_origin resources"
  value       = azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins
}
output "cdn_frontdoor_origins_cdn_frontdoor_origin_group_id" {
  description = "List of cdn_frontdoor_origin_group_id values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.cdn_frontdoor_origin_group_id]
}
output "cdn_frontdoor_origins_certificate_name_check_enabled" {
  description = "List of certificate_name_check_enabled values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.certificate_name_check_enabled]
}
output "cdn_frontdoor_origins_enabled" {
  description = "List of enabled values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.enabled]
}
output "cdn_frontdoor_origins_host_name" {
  description = "List of host_name values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.host_name]
}
output "cdn_frontdoor_origins_http_port" {
  description = "List of http_port values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.http_port]
}
output "cdn_frontdoor_origins_https_port" {
  description = "List of https_port values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.https_port]
}
output "cdn_frontdoor_origins_name" {
  description = "List of name values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.name]
}
output "cdn_frontdoor_origins_origin_host_header" {
  description = "List of origin_host_header values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.origin_host_header]
}
output "cdn_frontdoor_origins_priority" {
  description = "List of priority values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.priority]
}
output "cdn_frontdoor_origins_private_link" {
  description = "List of private_link values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.private_link]
}
output "cdn_frontdoor_origins_weight" {
  description = "List of weight values across all cdn_frontdoor_origins"
  value       = [for k, v in azurerm_cdn_frontdoor_origin.cdn_frontdoor_origins : v.weight]
}

