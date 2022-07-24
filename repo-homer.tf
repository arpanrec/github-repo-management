resource "github_repository" "homer" {
  name               = "homer"
  description        = "Home Page"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Node"
}

resource "github_branch_default" "homer" {
  repository = github_repository.homer.name
  branch     = var.repository_default_branch_01292022_main
}
