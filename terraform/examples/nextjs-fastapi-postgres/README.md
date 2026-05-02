# Terraform Example: Next.js + FastAPI + PostgreSQL

This example composes the PromptOps modules into a reviewable AWS MVP infrastructure plan.

## What It Models

- Private VPC subnets for RDS PostgreSQL.
- Public application entrypoint security group example.
- App Runner service for the FastAPI API container.
- S3 private bucket for static assets.
- CloudFront distribution with S3 Origin Access Control.
- Secrets Manager secret container.
- CloudWatch log groups with finite retention.
- AWS Budgets monthly alert guardrail.

## What It Does Not Do Automatically

- It does not create resources until `terraform apply` is run.
- It does not include real AWS Account IDs, ARNs, domains, Hosted Zone IDs, certificate ARNs, or secrets.
- It does not expose the database publicly.
- It does not create a NAT Gateway by default.

## Review Flow

```bash
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan -out promptops.plan
```

HUMAN APPROVAL REQUIRED: Review the Terraform plan, estimated cost, target AWS account, target region, and rollback steps before creating, updating, or deleting real AWS resources.

Only after approval:

```bash
terraform apply promptops.plan
```

## Required Replacements Before Real Deployment

- `budget_alert_email`
- `static_assets_bucket_name`
- `api_image_identifier`
- Optional custom domain and ACM certificate values
- Any environment-specific tags

## Rollback

- Application rollback: deploy the previous container image tag.
- Infrastructure rollback: revert the Terraform commit and review a new plan.
- Database rollback: restore from a snapshot only after explicit approval.
- Demo teardown: run `terraform destroy` only after approval and only for non-production environments.
