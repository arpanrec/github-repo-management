resource "github_repository" "github_repo_management" {
  name               = "github-repo-management"
  license_template   = var.license_template
  description        = "Manage the current github"
  visibility         = "public"
  gitignore_template = "Terraform"
  auto_init          = true
}

resource "github_branch_default" "github_repo_management" {
  repository = github_repository.github_repo_management.name
  branch     = var.repository_default_branch_01292022_main
}

resource "github_repository_environment" "github_repo_management_production" {
  environment = "production"
  repository  = github_repository.github_repo_management.name
}
