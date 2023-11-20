locals {
  common_tags = {
    deparment   = "IT"
    billingcode = "B001"
    project     = var.project_name
    environment = terraform.workspace == "default" ? "none" : terraform.workspace
  }
}