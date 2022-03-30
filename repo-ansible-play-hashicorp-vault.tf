resource "github_repository" "ansible_play_hashicorp_vault" {
  name               = "ansible-play-hashicorp-vault"
  description        = "Install Hashicorp Vault"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Python"
}

resource "github_branch_default" "ansible_play_hashicorp_vault" {
  repository = github_repository.ansible_play_hashicorp_vault.name
  branch     = var.repository_default_branch_01292022_main
}
