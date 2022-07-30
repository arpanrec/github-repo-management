resource "github_repository" "cluster_init" {
  name               = "cluster-init"
  description        = "initialize cluster"
  visibility         = "public"
  license_template   = var.license_template
  auto_init          = true
  gitignore_template = "Python"
}

resource "github_branch_default" "cluster_init" {
  repository = github_repository.cluster_init.name
  branch     = var.repository_default_branch_01292022_main
}
