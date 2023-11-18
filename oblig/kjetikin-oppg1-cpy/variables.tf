variable "environment" {
  type        = string
  description = "Environment of the configuration"
  default     = terraform.workspace == "default" ? "none" : terraform.workspace
}