locals {
  common_tags = {
    company      = var.company
    project      = "${var.project}-${var.company}"
    billing_code = var.billing_code
  }
}