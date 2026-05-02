# 3-Minute Demo Script

## 0:00-0:20 Open README

Open `README.md` and introduce the project:

PromptOps AWS Startup Launchpad is a production-ready AWS Prompt Kit for founders and developers who want AI coding agents to generate safe, low-cost, reviewable AWS MVP infrastructure.

## 0:20-0:45 Show Master Prompt

Open `prompt/master-prompt.md`.

Highlight:

- Role and mission
- Input requirements
- Output contract
- Safety boundaries
- Human approval gates
- Final validation checklist

Explain that this is the core artifact for AWS Prompt the Planet.

## 0:45-1:05 Fill User Input Template

Open `prompt/user-input-template.md`.

Show the Next.js + FastAPI + PostgreSQL sample fields. Point out that it asks only for non-secret values and explicitly rejects AWS keys, tokens, and `.env` contents.

## 1:05-1:35 Show AI Expected Output

Open `examples/nextjs-fastapi-postgres/expected-output/architecture.md`.

Explain that the prompt forces the agent to output architecture, assumptions, service rationale, cost controls, rollback, troubleshooting, and validation.

## 1:35-2:05 Show Terraform Example

Open `terraform/examples/nextjs-fastapi-postgres/main.tf`.

Highlight:

- App Runner for the API
- RDS PostgreSQL in private subnets
- S3 and CloudFront for static assets
- Secrets Manager for sensitive runtime values
- CloudWatch and AWS Budgets

## 2:05-2:30 Show Safety And Cost Controls

Open:

- `docs/SECURITY_BASELINE.md`
- `docs/COST_CONTROL.md`

Explain:

- No root account
- No hardcoded secrets
- No public database
- No fake AWS IDs
- Budget alerts are required
- NAT Gateway is avoided by default

## 2:30-2:50 Show Validation Checklist

Open `prompt/validation-checklist.md` and `tests/expected-output-checklist.md`.

Explain that the kit makes agent output measurable and reviewable.

## 2:50-3:00 Closing

Close with:

This helps founders launch on AWS safely by turning AI-generated infrastructure into a structured, auditable, cost-aware workflow with human approval before any real resources are created.
