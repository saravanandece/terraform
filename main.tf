module "firewall_rules" {
  for_each     = { for key, value in var.vpc_fws : "${value.name}" => value }
  source       = "../Modules/network/firewall-rules"
  project_id   = var.project_id
  network_name = each.value.vpc_name
  rules = [{
    name                    = each.value.name
    description             = each.value.description
    direction               = each.value.direction
    priority                = each.value.priority
    ranges                  = each.value.ranges
    source_tags             = each.value.source_tags
    source_service_accounts = each.value.source_service_accounts
    target_tags             = each.value.target_tags
    target_service_accounts = each.value.target_service_accounts
    allow                   = each.value.allow
    deny                    = each.value.deny
    log_config              = each.value.log_config
    }
  ]
}