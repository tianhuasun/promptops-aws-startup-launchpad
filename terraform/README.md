# Terraform Examples

This directory contains reviewable Terraform examples for the PromptOps AWS Startup Launchpad prompt kit.

## Safety Model

- These files are examples and should be reviewed before use.
- Do not commit `terraform.tfvars`, state files, `.env`, or real secrets.
- Do not run `terraform apply` until a human has reviewed the plan, expected cost, target account, target region, and rollback steps.
- The examples intentionally avoid real account IDs, real ARNs, real domains, and real secret values.

## Validation

Run local static validation only:

```bash
bash scripts/validate-terraform.sh
```

The validation script runs `terraform fmt -check` when Terraform is installed. It does not run `terraform apply` and does not create AWS resources.

## Module Overview

- `modules/networking`: VPC, public subnets, private subnets, and security groups.
- `modules/budget`: AWS Budgets monthly guardrail.
- `modules/s3_static_site`: Private S3 bucket for static assets.
- `modules/cloudfront`: CloudFront distribution with S3 Origin Access Control.
- `modules/apprunner_service`: App Runner service for containerized MVP workloads.
- `modules/rds_postgres`: Private encrypted RDS PostgreSQL.
- `modules/secrets_manager`: Secret container example without real secret values.
- `modules/cloudwatch`: Log groups and observability placeholders.

## Cost Notes

The default design avoids NAT Gateway because NAT Gateway hourly and data processing charges can surprise small MVP teams. If private workloads require outbound internet access, add NAT Gateway intentionally and document the cost tradeoff before applying.
