# Terraform Static Validation

This project does not execute real AWS deployment during validation.

## Required Static Check

Run:

```bash
terraform fmt -check -recursive terraform
```

This checks Terraform formatting across modules and examples.

## Terraform Validate

`terraform validate` requires provider initialization in each root module:

```bash
cd terraform/examples/nextjs-fastapi-postgres
terraform init
terraform validate
```

Only run this after confirming network/provider access is acceptable. Do not run `terraform apply` as part of static validation.

## Optional Tools

Teams may optionally run:

- `tfsec`
- `checkov`
- `terraform-docs`

These tools can improve security review but are not required by this repository.

## Prohibited During Validation

- Do not run `terraform apply`.
- Do not create real AWS resources.
- Do not write real secrets to `terraform.tfvars`.
- Do not commit `.terraform`, state files, or lock files unless intentionally reviewed.
