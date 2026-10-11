resource "google_privateca_ca_pool_iam_member" "privateca_ca_pool_iam_members" {
  for_each = var.privateca_ca_pool_iam_members

  ca_pool  = each.value.ca_pool
  member   = each.value.member
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

