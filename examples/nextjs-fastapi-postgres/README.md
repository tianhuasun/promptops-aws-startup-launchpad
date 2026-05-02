# Example: Next.js + FastAPI + PostgreSQL MVP

This is the primary PromptOps example. It shows the kind of output an AI coding agent should produce after using `prompt/master-prompt.md` with the startup MVP input template.

## Use Case

A founder wants to launch a small SaaS MVP with:

- Next.js frontend
- FastAPI backend
- PostgreSQL database
- File/static asset storage
- Low monthly budget
- Safe deployment path

## Expected AWS Direction

- AWS App Runner for the FastAPI container.
- S3 and CloudFront for static assets.
- RDS PostgreSQL in private subnets.
- Secrets Manager for runtime secrets.
- CloudWatch for logs.
- AWS Budgets for spend alerts.
- Terraform for reviewable infrastructure.

## Files

- `expected-output/architecture.md`
- `expected-output/terraform-plan-notes.md`
- `expected-output/deployment-steps.md`
- `expected-output/rollback-plan.md`
- `expected-output/troubleshooting.md`

No real AWS resources are created by this example.
