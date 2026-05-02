# DoraHacks Submission Copy

Copy the sections below into the DoraHacks submission form. Replace only the URL placeholders that are still marked as `TODO`.

## Project Name

PromptOps AWS Startup Launchpad

## One-Liner

PromptOps AWS Startup Launchpad is a production-ready AWS prompt kit that helps founders and developers use AI coding agents to generate secure, cost-aware, human-reviewable MVP infrastructure plans.

## Problem

Startup founders and builders increasingly use AI coding agents to move faster, but cloud infrastructure generation is risky when prompts are vague. An unguided agent can expose databases, skip budgets, hardcode secrets, invent AWS identifiers, or produce deployment instructions that cannot be reviewed or rolled back.

Early teams need a safe way to use AI for real AWS tasks without accidentally creating expensive, insecure, or unauditable infrastructure.

## Solution

PromptOps AWS Startup Launchpad is a complete AWS Prompt Kit for a common startup architecture: Next.js, FastAPI, PostgreSQL, S3, CloudFront, Secrets Manager, CloudWatch, AWS Budgets, Terraform, and AWS App Runner.

The master prompt instructs an AI coding agent to generate a full AWS launch package with:

- Executive summary
- Assumptions
- Target AWS architecture
- Service selection rationale
- Terraform file plan or contents
- Deployment steps
- Rollback steps
- Security baseline
- Cost estimate
- Budget guardrails
- Observability plan
- Troubleshooting guide
- Validation checklist
- Next steps

## Why AWS Prompt The Planet

The challenge asks for complete prompts that help users accomplish real AWS tasks with prerequisites, use cases, expected outcomes, troubleshooting, and alignment with AWS best practices.

This submission is designed exactly for that: it is a verbatim, reusable prompt package that helps users generate reviewable AWS MVP infrastructure plans while following AWS Well-Architected principles. The main artifact can be copied directly into an AI coding agent and evaluated against the included examples and validation checklist.

## How The Prompt Works

1. The user fills in a non-secret input template.
2. The master prompt checks prerequisites, use case, assumptions, and missing values.
3. The AI coding agent produces a structured AWS launch package.
4. The user reviews Terraform, cost, security, rollback, troubleshooting, and AWS Well-Architected alignment.
5. Human approval is required before any real deployment or destructive action.

The prompt explicitly forbids asking for real AWS keys, using the root account, exposing databases publicly, opening database ingress to `0.0.0.0/0`, hardcoding passwords, skipping budgets or logs, and inventing AWS Account IDs, ARNs, CloudFront domains, Hosted Zone IDs, or Certificate ARNs.

## What AWS Services It Covers

- AWS App Runner
- Amazon RDS for PostgreSQL
- Amazon S3
- Amazon CloudFront
- AWS Secrets Manager
- Amazon CloudWatch
- AWS Budgets
- Amazon VPC networking
- Terraform AWS provider
- Optional GitHub Actions workflow planning

## Expected Outcome

The expected output is a reviewable AWS MVP launch package, not a claim that infrastructure has already been deployed. It should give a founder enough structure to understand the proposed architecture, review Terraform changes, estimate cost risk, and decide whether to proceed with a real AWS deployment after human approval.

## Safety And Cost Controls

- No real secrets in prompts, examples, commits, or outputs.
- No default production resource creation.
- No AWS root account usage.
- Private database by default.
- No `0.0.0.0/0` database ingress.
- S3 private by default.
- Secrets Manager for sensitive values.
- AWS Budgets required for every plan.
- CloudWatch logs required for every plan.
- NAT Gateway avoided by default to prevent surprise cost.
- Finite log retention.
- Human approval gates before `terraform apply`, `terraform destroy`, DNS changes, production database changes, or budget increases.
- Cost estimates are planning ranges, not billing guarantees.
- Unknown account-specific values are written as `TODO` rather than fabricated.

## Demo Instructions

1. Open `README.md` for the project overview.
2. Open `prompt/master-prompt.md` and show the complete prompt contract.
3. Open `prompt/user-input-template.md` and show the non-secret startup MVP input.
4. Open `examples/nextjs-fastapi-postgres/expected-output/architecture.md` to show the expected AI output.
5. Open `terraform/examples/nextjs-fastapi-postgres/main.tf` to show the reviewable Terraform example.
6. Open `docs/SECURITY_BASELINE.md` and `docs/COST_CONTROL.md` to show safety and cost guardrails.
7. Run `bash scripts/test-all.sh` to show local validation.

No real AWS resources are created during the demo.

## GitHub URL

https://github.com/tianhuasun/promptops-aws-startup-launchpad

## Demo Video URL

TODO: add demo video URL after recording

## DoraHacks BUIDL URL

TODO: add DoraHacks BUIDL URL after submission page is created

## Future Roadmap

- v0.2: CDK version of the prompt kit.
- v0.3: GitHub Actions generator.
- v0.4: Multi-region architecture option.
- v0.5: AWS Well-Architected auto-review checklist.
- v1.0: Public prompt library submission version.
