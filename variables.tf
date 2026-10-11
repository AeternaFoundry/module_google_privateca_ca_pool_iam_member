variable "privateca_ca_pool_iam_members" {
  description = <<EOT
Map of privateca_ca_pool_iam_members, attributes below
Required:
    - ca_pool
    - member
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    ca_pool  = string
    member   = string
    role     = string
    location = optional(string)
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

