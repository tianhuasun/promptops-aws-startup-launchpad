# Troubleshooting

## Terraform Init Failed

Likely causes:

- Terraform is not installed.
- Network access to the provider registry failed.
- Provider version constraints are incompatible.

Checks:

```bash
terraform version
terraform init -upgrade
```

Safe remediation: install Terraform, check network connectivity, and review provider constraints. Do not run apply until init and validation succeed.

## Terraform Fmt Failed

Likely cause: Terraform files are not formatted.

Check:

```bash
terraform fmt -check -recursive terraform
```

Safe remediation:

```bash
terraform fmt -recursive terraform
```

Review formatting changes before commit.

## AWS Credentials Missing

Likely cause: no local AWS CLI profile or environment credentials are configured.

Check:

```bash
aws sts get-caller-identity --profile <profile-name>
```

Safe remediation: configure an AWS profile locally. Do not paste access keys into prompts, code, or chat.

## AWS Profile Not Found

Likely cause: `AWS_PROFILE` points to a profile that does not exist.

Check:

```bash
aws configure list-profiles
```

Safe remediation: choose an existing profile or configure a new one using local AWS CLI flows.

## Region Not Enabled

Likely cause: the selected AWS region is disabled or unsupported for a service.

Check:

```bash
aws ec2 describe-regions --all-regions
```

Safe remediation: choose an enabled region that supports App Runner, RDS, CloudFront, S3, CloudWatch, Secrets Manager, and Budgets.

## App Runner Build Failed

Likely causes:

- Container image does not exist.
- App Runner cannot access the image repository.
- Port or health check path is wrong.
- Runtime environment variables are incomplete.

Checks:

- Verify the image URI.
- Review App Runner event logs.
- Check CloudWatch logs.
- Confirm health check path returns success.

Safe remediation: fix image reference, repository permissions, port, and health endpoint before redeploying.

## RDS Connection Failed

Likely causes:

- App cannot reach the private database.
- Security group does not allow app-to-db traffic.
- Secret value or username is wrong.
- Database is still creating.

Checks:

- Review RDS status.
- Review security group rules.
- Confirm application runtime secret mapping.
- Check App Runner logs.

Safe remediation: keep the database private and fix network/security group access. Do not open database ingress to `0.0.0.0/0`.

## CloudFront Cache Issue

Likely causes:

- Cached old static assets.
- Incorrect cache behavior.
- Wrong origin path.

Checks:

- Review cache behavior.
- Confirm origin points to the correct S3 bucket.
- Use an invalidation only when needed.

Safe remediation: invalidate specific paths or use versioned asset names.

## S3 Access Denied

Likely causes:

- Bucket is private.
- CloudFront OAC policy is missing or incorrect.
- Object key is wrong.

Checks:

- Review S3 bucket policy.
- Review CloudFront OAC configuration.
- Confirm object path.

Safe remediation: grant read access to CloudFront OAC only. Do not make the bucket public.

## Budget Alarm Not Received

Likely causes:

- Alert email is still the sample value.
- Email confirmation was not completed.
- Budget threshold has not been crossed.

Checks:

- Review AWS Budgets notification settings.
- Confirm the email recipient.
- Check spam filtering.

Safe remediation: replace the sample value with a real monitored email before deployment.

## Secrets Manager Access Denied

Likely causes:

- App Runner instance role lacks permission.
- Secret ARN is wrong.
- KMS key policy blocks access.

Checks:

- Review IAM role permissions.
- Confirm secret ARN.
- Review KMS permissions if using a customer-managed key.

Safe remediation: grant least-privilege `secretsmanager:GetSecretValue` to the specific secret ARN only.
