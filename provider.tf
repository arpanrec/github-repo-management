terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {
  owner = "arpanrec"
  token = var.GITHUB_TOKEN
}
