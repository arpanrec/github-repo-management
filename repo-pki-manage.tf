resource "github_repository" "pki_manage" {
  name               = "pki-manage"
  license_template   = var.license_template
  description        = "Manage PKI"
  visibility         = "public"
  gitignore_template = "Python"
  auto_init          = true
}

resource "github_branch_default" "pki_manage" {
  repository = github_repository.pki_manage.name
  branch     = var.repository_default_branch_01292022_main
}
