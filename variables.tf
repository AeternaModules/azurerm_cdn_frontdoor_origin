variable "cdn_frontdoor_origins" {
  description = <<EOT
Map of cdn_frontdoor_origins, attributes below
Required:
    - cdn_frontdoor_origin_group_id
    - certificate_name_check_enabled
    - host_name
    - name
Optional:
    - enabled
    - http_port
    - https_port
    - origin_host_header
    - priority
    - weight
    - private_link (block):
        - location (required)
        - private_link_target_id (required)
        - request_message (optional)
        - target_type (optional)
EOT

  type = map(object({
    cdn_frontdoor_origin_group_id  = string
    certificate_name_check_enabled = bool
    host_name                      = string
    name                           = string
    enabled                        = optional(bool)   # Default: true
    http_port                      = optional(number) # Default: 80
    https_port                     = optional(number) # Default: 443
    origin_host_header             = optional(string)
    priority                       = optional(number) # Default: 1
    weight                         = optional(number) # Default: 500
    private_link = optional(object({
      location               = string
      private_link_target_id = string
      request_message        = optional(string) # Default: "Access request for CDN FrontDoor Private Link Origin"
      target_type            = optional(string)
    }))
  }))
}

