# Example: Static Site With CloudFront And S3

This example shows a simpler prompt output for a static website.

## Use Case

A builder wants to publish a static marketing site or documentation site on AWS with low cost, HTTPS, CDN caching, and private S3 origin access.

## Expected AWS Services

- Amazon S3 for static files.
- Amazon CloudFront for CDN and HTTPS.
- CloudFront Origin Access Control for private bucket access.
- CloudWatch for access and operational visibility where configured.
- AWS Budgets for monthly cost guardrails.

## Safety Rules

- Do not make the S3 bucket public by default.
- Do not invent a CloudFront domain before deployment.
- Do not invent a certificate ARN or Hosted Zone ID.
- Require human approval before `terraform apply`.
