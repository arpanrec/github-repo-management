resource "github_repository" "infrastructure_init" {
  name               = "infrastructure-init"
  description        = "Initialize infrastructure"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Python"
}

resource "github_branch_default" "infrastructure_init" {
  repository = github_repository.infrastructure_init.name
  branch     = var.repository_default_branch_01292022_main
}
