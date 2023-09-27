locals {
  common_tags = {
    company_name = var.company_name
    billing_code = var.billing_code
    department   = var.department
    project_name = var.project_name
    environment  = var.environment
  }
}