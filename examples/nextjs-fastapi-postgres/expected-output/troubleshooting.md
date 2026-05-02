# Expected Output: Troubleshooting

## Terraform Init Failed

Likely cause: Terraform provider download failed or Terraform is missing.

Check:

```bash
terraform version
terraform init -upgrade
```

Fix Terraform installation or provider constraints before continuing.

## AWS Credentials Missing

Likely cause: no local AWS profile is configured.

Check:

```bash
aws sts get-caller-identity --profile YOUR_PROFILE
```

Configure a local AWS profile. Do not paste AWS keys into the prompt.

## App Runner Health Check Failed

Likely cause: wrong port, missing `/health` endpoint, image pull issue, or missing runtime variables.

Check App Runner events and CloudWatch logs. Fix the container image and health endpoint, then redeploy after plan review.

## RDS Connection Failed

Likely cause: wrong security group, secret mapping, database endpoint, or application network path.

Confirm the database is private and the app security group can reach port 5432. Do not open the database to `0.0.0.0/0`.

## S3 Access Denied

Likely cause: private bucket without correct CloudFront OAC policy.

Review bucket policy and CloudFront OAC settings. Do not make the bucket public.

## Budget Alert Not Received

Likely cause: placeholder email, unconfirmed email, or threshold not reached.

Replace the placeholder email before deployment and verify the alert recipient.
