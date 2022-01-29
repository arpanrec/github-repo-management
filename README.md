# GitHub Repository Management

[Terraform](https://www.terraform.io) Project for managing all GitHub repositories.

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
* Access token to app.terraform.io is stored in GitHub Actions secrets `TF_API_TOKEN`. This allows GitHub Actions to
  communicate with [Terraform Cloud](https://app.terraform.io/app/arpanrec/workspaces/github-repo-management).

### @ Terraform Cloud

* GitHub Access Token is added in Terraform Cloud Workspace variables `Terraform variable` with key `GITHUB_TOKEN` and
  marked as `Sensitive`

## Local Run

Make sure the [Terraform Binary](https://www.terraform.io/downloads) is in your PATH.

[Terraform Login](https://www.terraform.io/cli/commands/login) to [Terraform cloud](https://app.terraform.io/app/arpanrec)

```shell
terraform login
```

Initialize the Terraform workspace with `terraform init`.

```shell
terraform init
```

Make sure to populate the file `.secret.all.json` with sensitive data needed.

```json
{
  "GITHUB_TOKEN": ""
}
```

Make changes and plan the changes with `terraform plan`.

```shell
terraform plan -input=false -var-file=".secret.all.json" -out="./tfplan"
```

Apply the changes with `terraform apply`.

```shell
terraform apply "./tfplan"
```

## TODO
GitHub Actions secrets `TF_API_TOKEN` for [github-repo-management](https://github.com/arpanrec/github-repo-management) is added manually. This should be pulled from vault.
