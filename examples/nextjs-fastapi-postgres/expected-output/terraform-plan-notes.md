# Expected Output: Terraform Plan Notes

## Directory Structure

```text
terraform/
  modules/
    networking/
    budget/
    s3_static_site/
    cloudfront/
    apprunner_service/
    rds_postgres/
    secrets_manager/
    cloudwatch/
  examples/
    nextjs-fastapi-postgres/
      main.tf
      variables.tf
      outputs.tf
      README.md
```

## Required Modules

### networking

Creates VPC, public subnets, private subnets, application security group, and database security group. It does not create NAT Gateway by default.

### budget

Creates AWS Budgets monthly budget with alert thresholds. The email must be replaced before real deployment.

### s3_static_site

Creates a private encrypted S3 bucket. Public access is blocked.

### cloudfront

Creates CloudFront distribution with S3 Origin Access Control. Custom domain and ACM certificate remain missing values until supplied by the user.

### apprunner_service

Creates an App Runner service for the FastAPI API. Runtime secrets are referenced by ARN only.

### rds_postgres

Creates private encrypted RDS PostgreSQL. `publicly_accessible = false`.

### secrets_manager

Creates secret containers without real secret values.

### cloudwatch

Creates log groups with finite retention.

## Human Approval Gate

HUMAN APPROVAL REQUIRED: Review the Terraform plan, estimated cost, target AWS account, target region, and rollback steps before creating, updating, or deleting real AWS resources.

## Values That Must Not Be Invented

- AWS Account ID
- ARNs
- CloudFront domain
- Hosted Zone ID
- Certificate ARN
- ECR repository URL
- App Runner service URL
- Production secrets
