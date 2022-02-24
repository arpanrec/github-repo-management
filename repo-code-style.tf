resource "github_repository" "code_style" {
  name             = "code-style"
  license_template = var.license_template
  description      = "Coding Guidelines"
  visibility       = "public"
  auto_init        = true
}
resource "github_branch_default" "code_style" {
  repository = github_repository.code_style.name
  branch     = var.repository_default_branch_01292022_main
}
