# Expected Output: Serverless API Deployment Steps

## Prerequisites

- Terraform installed.
- AWS CLI profile configured locally.
- API routes and DynamoDB access patterns reviewed.
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

## Expected Outcome

A serverless API baseline exists with Lambda, DynamoDB, logs, budget guardrails, and least-privilege access.

## Rollback

- Revert function code or image version.
- Revert Terraform changes and review plan.
- Preserve DynamoDB data before destructive changes.
- Destroy only non-production demo resources after approval.
