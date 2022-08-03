# GitHub Repository Management

[![Terraform](https://github.com/arpanrec/github-repo-management/actions/workflows/terraform.yml/badge.svg)](https://github.com/arpanrec/github-repo-management/actions/workflows/terraform.yml)

[Terraform](https://www.terraform.io) Project for managing all GitHub repositories.

Prerequisite:

* [terraform-cloud-management](https://github.com/arpanrec/terraform-cloud-management)
* GitHub API Token [Only for local run, Not Needed for CICD Github Actions]

## Workflow and Configuration

### @ Backend

Current backend is stored at `./backend_config.tf`

```hcl
terraform {
  backend "remote" {
    organization = "arpanrec"
    workspaces {
      name = "github-repo-management"
    }
  }
}
```

### @ GitHub

* Actions: Trigger Push on Main Branch, [Terraform Actions](.github/workflows/terraform.yml)
* Access token to app.terraform.io is stored in GitHub Actions secrets `TF_PROD_TOKEN`. This allows GitHub Actions to
  communicate with [Terraform Cloud](https://app.terraform.io/app/arpanrec/workspaces/github-repo-management).

## Local Run

Make sure the [Terraform Binary](https://www.terraform.io/downloads) is in your PATH.

### [Terraform Login](https://www.terraform.io/cli/commands/login) to [Terraform cloud](https://app.terraform.io/app/arpanrec)

```shell
terraform login
```

or
populate `$HOME/.terraform.d/credentials.tfrc.json`

```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "xxxx.xxxx.xxxxxxxx"
    }
  }
}
```

### Add github token

Create a file `./secrets.auto.tfvars`

```hcl
GITHUB_TOKEN = "ghp_xxxxxxxxxxxxxxxxxxxxxxxxx"
```

** This file will be created automatically in CICD Github Actions.

### Initialize the Terraform workspace with `terraform init`

```shell
terraform init
```

### Make changes and plan the changes with `terraform plan`

```shell
terraform plan -input=false -out="./tfplan"
```

### Apply the changes with `terraform apply`

```shell
terraform apply "./tfplan"
```

## TODO

GitHub Actions secrets `TF_PROD_TOKEN` for [github-repo-management](https://github.com/arpanrec/github-repo-management) is added manually. This should be pulled from vault.
