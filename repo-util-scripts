resource "github_repository" "util_scripts" {
  name               = "util-scripts"
  description        = "Day to Day Utility Scripts"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Python"
}

resource "github_branch_default" "util_scripts" {
  repository = github_repository.util_scripts.name
  branch     = var.repository_default_branch_01292022_main
}
