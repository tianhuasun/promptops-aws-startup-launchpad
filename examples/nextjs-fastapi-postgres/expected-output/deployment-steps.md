# Expected Output: Deployment Steps

## Prerequisites

- Terraform installed locally.
- AWS CLI installed locally.
- AWS profile configured without sharing keys in chat or code.
- Reviewed non-secret values in `terraform.tfvars`.
- Container image built and pushed to an approved repository.
- Budget alert email ready to receive notifications.

## Local Validation

```bash
terraform fmt -check -recursive terraform
cd terraform/examples/nextjs-fastapi-postgres
terraform init
terraform validate
terraform plan -out promptops.plan
```

## Human Approval Gate

HUMAN APPROVAL REQUIRED: Review the Terraform plan, estimated cost, target AWS account, target region, and rollback steps before creating, updating, or deleting real AWS resources.

## Apply Only After Approval

```bash
terraform apply promptops.plan
```

## Post-Deployment Checks

- Confirm App Runner service is healthy.
- Confirm CloudWatch logs are receiving entries.
- Confirm RDS is private and not publicly accessible.
- Confirm AWS Budgets notification email is configured.
- Confirm S3 bucket public access block is enabled.
- Confirm no real secret values are present in Terraform output.

## Expected Outcome

A review-approved AWS MVP infrastructure baseline exists for a Next.js + FastAPI + PostgreSQL product, with security, cost, observability, rollback, and troubleshooting paths documented.
