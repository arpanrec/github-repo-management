terraform {
  backend "remote" {
    organization = "arpanrec"
    workspaces {
      name = "github-repo-management"
    }
  }
}
