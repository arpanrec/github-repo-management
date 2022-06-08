resource "github_repository" "bitwarden_export_migrate" {
  name             = "bitwarden-export-migrate"
  license_template = var.license_template
}

resource "github_branch_default" "bitwarden_export_migrate" {
  repository = github_repository.bitwarden_export_migrate.name
  branch     = var.repository_default_branch_01292022_main
}

resource "github_branch" "bitwarden_export_migrate_keepass_export" {
  repository    = github_repository.bitwarden_export_migrate.name
  branch        = "keepass_export"
  source_branch = var.repository_default_branch_01292022_main
}
