resource "github_repository" "terraform_cloud_management" {
  name               = "terraform-cloud-management"
  license_template   = var.license_template
  description        = "Manage Terraform Cloud Workspaces"
  visibility         = "public"
  gitignore_template = "Terraform"
  auto_init          = true
}

resource "github_branch_default" "terraform_cloud_management" {
  repository = github_repository.terraform_cloud_management.name
  branch     = var.repository_default_branch_01292022_main
}

resource "github_repository_environment" "terraform_cloud_management_production" {
  environment = "production"
  repository  = github_repository.terraform_cloud_management.name
}
