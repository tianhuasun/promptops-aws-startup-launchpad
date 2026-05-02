# Security Baseline

## IAM Least Privilege

Use least-privilege IAM roles and policies. Avoid broad wildcard permissions unless they are temporary, documented, and reviewed. Do not use the AWS root account for deployment.

## Secrets Manager

Store application secrets, database credentials, OAuth secrets, JWT signing secrets, and third-party API tokens in AWS Secrets Manager. Terraform may reference secret ARNs, but it must not output secret values.

## No Hardcoded Secrets

Do not commit:

- `.env`
- `terraform.tfvars`
- AWS keys
- OpenAI keys
- Database passwords
- Tokens
- Private certificates
- SSH keys

Only commit `.env.example` and `terraform.tfvars.example`.

## RDS Private Access

RDS PostgreSQL must be deployed in private subnets by default. The database security group must not allow inbound access from `0.0.0.0/0`.

## HTTPS

Public application traffic should use HTTPS. CloudFront should redirect viewers to HTTPS. Custom domains require a real ACM certificate ARN supplied by the user during deployment review.

## Logging

CloudWatch logs must be included for application and database observability. Logs should use finite retention to avoid unnecessary cost.

## Budget Alerts

AWS Budgets must be included as a safety control. The alert email in examples is a sample value and must be replaced before real deployment.

## Human Confirmation Before Deployment

Every real deployment requires:

- Terraform plan review
- Cost estimate review
- Target AWS account review
- Target region review
- Rollback review
- Human approval

## No Root Account Usage

Do not use the AWS root account for routine deployment. Use a named IAM role, AWS IAM Identity Center, or a locally configured AWS CLI profile with appropriate permissions.

## No Public Database

Do not expose the database publicly. If temporary database access is needed for maintenance, use a controlled pattern such as VPN, Session Manager, a restricted bastion, or a short-lived reviewed access path.
