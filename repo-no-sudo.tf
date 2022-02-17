resource "github_repository" "no_sudo" {
  name               = "no-sudo"
  description        = "Install Apps in user directory"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Python"
}

resource "github_branch_default" "ansible_playbook_userapps" {
  repository = github_repository.ansible_playbook_userapps.name
  branch     = var.repository_default_branch_01292022_main
}
