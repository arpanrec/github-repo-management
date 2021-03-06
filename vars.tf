variable "license_template" {
  default = "mit"
}

variable "repository_default_branch_01292022_main" {
  default     = "main"
  description = "This is the default branch for the repository at the time of creation."
}

variable "GITHUB_TOKEN" {
  default   = ""
  sensitive = true
  validation {
    condition     = length(var.GITHUB_TOKEN) == 40
    error_message = "Must be a 40 character long API token."
  }
}
