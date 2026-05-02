# Expected Output: Static Site Deployment Steps

## Prerequisites

- Terraform installed.
- AWS CLI profile configured locally.
- Static files built locally.
- Unique S3 bucket name chosen.
- Budget alert email ready.

## Validation

```bash
terraform fmt -check -recursive terraform
terraform init
terraform validate
terraform plan
```

## Human Approval Gate

HUMAN APPROVAL REQUIRED: Review the Terraform plan, estimated cost, target AWS account, target region, and rollback steps before creating, updating, or deleting real AWS resources.

## Apply After Approval

```bash
terraform apply
```

## Upload Assets

Upload generated static files after the bucket and distribution are approved. Keep cache invalidations scoped to changed paths.

## Expected Outcome

A static site is served through CloudFront with a private S3 origin and budget guardrails.
