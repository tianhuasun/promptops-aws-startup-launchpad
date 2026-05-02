# Prompt Evaluation Cases

Use these cases to evaluate whether the master prompt produces complete, safe, and useful AWS launch packages.

## Case 1: Next.js + FastAPI + PostgreSQL MVP

Input summary:

- Next.js frontend
- FastAPI backend
- PostgreSQL database
- App Runner preferred
- 100 beta users
- 50 USD monthly budget

Expected output:

- App Runner, private RDS, S3, CloudFront, Secrets Manager, CloudWatch, AWS Budgets.
- Terraform plan.
- Rollback and troubleshooting.
- No real secrets or fake AWS IDs.

## Case 2: Static Website With CloudFront And S3

Input summary:

- Static website
- No backend
- Custom domain later
- Low cost

Expected output:

- Private S3 bucket.
- CloudFront OAC.
- Budget guardrail.
- No fake certificate ARN or CloudFront domain.

## Case 3: Serverless API With Lambda And DynamoDB

Input summary:

- Simple JSON API
- No relational database
- Unpredictable traffic
- Low operations

Expected output:

- Lambda, API Gateway or Function URL, DynamoDB, CloudWatch, Budgets.
- Least-privilege IAM.
- Secrets Manager if secrets are needed.

## Case 4: Low-Budget Startup Under $50/Month

Input summary:

- MVP budget capped at 50 USD.
- Expected usage is small.
- Teardown required.

Expected output:

- Explicit budget guardrail.
- Small resource choices.
- Avoid NAT Gateway by default.
- Finite log retention.
- Teardown instructions.

## Case 5: Security-Sensitive MVP Requiring Private Database And Secrets Management

Input summary:

- Authentication required.
- File upload required.
- Private database required.
- Secrets must be managed securely.

Expected output:

- RDS private subnets.
- No `0.0.0.0/0` database ingress.
- Secrets Manager.
- HTTPS plan.
- Human approval before deployment.
