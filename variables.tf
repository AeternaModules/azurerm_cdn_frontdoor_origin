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
  # path: host_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: http_port
  #   condition: value >= 1 && value <= 65535
  #   message:   must be between 1 and 65535
  # path: https_port
  #   condition: value >= 1 && value <= 65535
  #   message:   must be between 1 and 65535
  # path: origin_host_header
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: priority
  #   condition: value >= 1 && value <= 5
  #   message:   must be between 1 and 5
  # path: private_link.location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: private_link.private_link_target_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: private_link.private_link_target_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: private_link.request_message
  #   condition: length(value) >= 1 && length(value) <= 140
  #   message:   must be between 1 and 140 characters
  # path: private_link.target_type
  #   condition: contains(["blob", "blob_secondary", "Gateway", "managedEnvironments", "sites", "web", "web_secondary"], value)
  #   message:   must be one of: blob, blob_secondary, Gateway, managedEnvironments, sites, web, web_secondary
  # path: weight
  #   condition: value >= 1 && value <= 1000
  #   message:   must be between 1 and 1000
}

