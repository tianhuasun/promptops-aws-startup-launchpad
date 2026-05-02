# Expected Output: Architecture

## Executive Summary

This MVP uses AWS managed services to launch a Next.js + FastAPI + PostgreSQL application with a low-cost, security-first architecture. The design keeps the database private, stores secrets in Secrets Manager, serves static assets through CloudFront and S3, runs the API on App Runner, records logs in CloudWatch, and enforces spend awareness through AWS Budgets.

## Assumptions

- Region: `us-east-1`
- Monthly budget: `50 USD`
- Environment: development MVP with production-ready structure
- Custom domain: `example.com` placeholder only
- No regulated workload is assumed
- No real AWS Account ID, ARN, certificate ARN, Hosted Zone ID, or secret value is known

## Target AWS Architecture

```text
Browser
  -> CloudFront
    -> Private S3 bucket for static assets
  -> App Runner FastAPI service
    -> Secrets Manager for runtime secrets
    -> Private RDS PostgreSQL

Operations:
  -> CloudWatch logs
  -> AWS Budgets alerts
  -> Terraform plan review
```

## Service Selection Rationale

- App Runner: low-operations container runtime for early MVP APIs.
- RDS PostgreSQL: managed relational database with backups and encryption.
- S3: durable static asset storage.
- CloudFront: global CDN and HTTPS entrypoint.
- Secrets Manager: managed secret references without hardcoded values.
- CloudWatch: baseline logs and operational visibility.
- AWS Budgets: cost guardrail for small teams.
- Terraform: auditable, version-controlled infrastructure.

## Security Baseline

- Use a non-root AWS identity.
- Keep RDS in private subnets.
- Deny database ingress from `0.0.0.0/0`.
- Keep S3 private and use CloudFront OAC.
- Store secrets in Secrets Manager.
- Use HTTPS for public endpoints.
- Review Terraform plan before apply.

## AWS Well-Architected Mapping

- Operational Excellence: Terraform, logs, validation, rollback.
- Security: private database, Secrets Manager, least privilege.
- Reliability: RDS backups and rollback planning.
- Performance Efficiency: App Runner and CDN defaults.
- Cost Optimization: budgets, small RDS, no NAT Gateway by default.
- Sustainability: right-sized resources and teardown path.
