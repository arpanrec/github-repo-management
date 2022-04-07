resource "github_repository" "bitwarden_cli_api_wrapper" {
  name               = "bitwarden-cli-api-wrapper"
  description        = "Rest API wrapper for bitwarden CLI Python"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Python"
}

resource "github_branch_default" "bitwarden_cli_api_wrapper" {
  repository = github_repository.bitwarden_cli_api_wrapper.name
  branch     = var.repository_default_branch_01292022_main
}
