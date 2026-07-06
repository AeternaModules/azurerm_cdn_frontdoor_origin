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
  # --- Unconfirmed validation candidates, derived from azurerm_cdn_frontdoor_origin's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.FrontDoorOriginName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: cdn_frontdoor_origin_group_id
  #   source:    [from validate.FrontDoorOriginGroupID] !ok
  # path: cdn_frontdoor_origin_group_id
  #   source:    [from validate.FrontDoorOriginGroupID] err != nil
  # path: origin_host_header
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: private_link.location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: private_link.private_link_target_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: private_link.private_link_target_id
  #   source:    [from azure.ValidateResourceID] err != nil
}

