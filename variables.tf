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
    enabled                        = optional(bool)
    http_port                      = optional(number)
    https_port                     = optional(number)
    origin_host_header             = optional(string)
    priority                       = optional(number)
    weight                         = optional(number)
    private_link = optional(object({
      location               = string
      private_link_target_id = string
      request_message        = optional(string)
      target_type            = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        length(v.host_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        v.http_port == null || (v.http_port >= 1 && v.http_port <= 65535)
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        v.https_port == null || (v.https_port >= 1 && v.https_port <= 65535)
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        v.priority == null || (v.priority >= 1 && v.priority <= 5)
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        v.private_link == null || (v.private_link.request_message == null || (length(v.private_link.request_message) >= 1 && length(v.private_link.request_message) <= 140))
      )
    ])
    error_message = "must be between 1 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        v.private_link == null || (v.private_link.target_type == null || (contains(["blob", "blob_secondary", "Gateway", "managedEnvironments", "sites", "web", "web_secondary"], v.private_link.target_type)))
      )
    ])
    error_message = "must be one of: blob, blob_secondary, Gateway, managedEnvironments, sites, web, web_secondary"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_origins : (
        v.weight == null || (v.weight >= 1 && v.weight <= 1000)
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

