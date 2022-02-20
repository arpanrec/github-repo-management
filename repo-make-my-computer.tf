resource "github_repository" "make_my_computer" {
  name = "make-my-computer"
  license_template   = var.license_template
  description        = "automated script for os installation"
  visibility         = "public"
  gitignore_template = "Python"
  auto_init          = true
}

resource "github_branch_default" "make_my_computer" {
  repository = github_repository.make_my_computer.name
  branch     = var.repository_default_branch_01292022_main
}
