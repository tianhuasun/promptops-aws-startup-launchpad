# DoraHacks Submission Copy

Copy these sections into the DoraHacks submission form. The GitHub repository is the primary review artifact.

## Project Name

PromptOps AWS Startup Launchpad

## Short Description

PromptOps AWS Startup Launchpad is a structured prompt kit for planning and reviewing AWS MVP infrastructure with an AI coding agent. It centers on a complete master prompt, supporting documentation, Terraform examples, safety rules, cost controls, rollback guidance, and local validation scripts.

## One-Liner

A structured AWS prompt kit that helps startup builders generate reviewable MVP infrastructure plans with Terraform, safety checks, cost controls, rollback steps, and troubleshooting notes.

## Problem

Startup builders often know the application stack they want to ship, but struggle with safe, low-cost AWS infrastructure planning. A vague AI prompt can lead to risky output: public databases, missing budgets, hardcoded secrets, invented AWS identifiers, unclear rollback paths, or deployment steps that are difficult to review.

The project addresses that gap by giving the AI coding agent a stricter operating contract before it generates cloud architecture or Terraform guidance.

## Solution

PromptOps AWS Startup Launchpad provides a complete master prompt and supporting review materials for a common startup workload: Next.js, FastAPI, PostgreSQL, S3, CloudFront, Secrets Manager, CloudWatch, AWS Budgets, Terraform, and AWS App Runner.

The prompt guides an AI coding agent to produce:

- AWS architecture and service rationale
- Terraform file plan or example contents
- Deployment prerequisites and approval gates
- Security checks and safety boundaries
- Cost estimate ranges and AWS Budgets guidance
- Rollback and teardown steps
- Troubleshooting notes
- AWS Well-Architected mapping

The repository also includes expected outputs, Terraform modules, validation scripts, and a judge guide so the project can be reviewed directly from GitHub.

## Why AWS Prompt The Planet

The public challenge requirements emphasize a complete prompt, context documentation, AWS services, best-practice alignment, and troubleshooting. This repository maps to those requirements directly:

- Complete prompt: `prompt/master-prompt.md`
- Context and documentation: `prompt/`, `docs/`, and `examples/`
- AWS services: App Runner, RDS PostgreSQL, S3, CloudFront, Secrets Manager, CloudWatch, AWS Budgets, VPC networking, and Terraform
- Best practices: private database by default, no root account, no hardcoded secrets, private S3 origin access, budget alerts, finite log retention, and human approval before real deployment
- Troubleshooting: `docs/TROUBLESHOOTING.md` and example troubleshooting output

The project does not claim that infrastructure has already been deployed. It is a prompt package and review workflow for safer AWS planning.

## How The Prompt Works

1. The user fills in a non-secret input template.
2. The master prompt checks prerequisites, assumptions, missing values, safety rules, and cost constraints.
3. The AI coding agent produces a structured AWS launch package.
4. The user reviews Terraform, cost, security, rollback, troubleshooting, and Well-Architected alignment.
5. Real deployment requires explicit human approval.

## Safety And Cost Controls

- No real secrets in prompts, examples, commits, or outputs.
- No AWS root account usage.
- Private RDS PostgreSQL by default.
- No database ingress from `0.0.0.0/0`.
- S3 private by default with CloudFront Origin Access Control.
- Secrets Manager for sensitive runtime values.
- AWS Budgets required in every generated plan.
- CloudWatch logs required in every generated plan.
- NAT Gateway avoided by default for low-budget MVPs unless the cost tradeoff is explicit.
- Cost estimates are planning ranges, not billing guarantees.
- Human approval before `terraform apply`, `terraform destroy`, DNS changes, production database changes, secret rotation, budget increases, or high-cost service changes.

## Repository Review Path

1. Open `README.md`.
2. Open `docs/JUDGE_GUIDE.md`.
3. Inspect `prompt/master-prompt.md`.
4. Inspect `prompt/user-input-template.md`.
5. Review `examples/nextjs-fastapi-postgres/expected-output/architecture.md`.
6. Review `terraform/examples/nextjs-fastapi-postgres/main.tf`.
7. Run `bash scripts/test-all.sh` for local validation.

The validation scripts do not create AWS resources and do not require real AWS credentials.

## Repository URL

https://github.com/tianhuasun/promptops-aws-startup-launchpad

## Website URL

https://github.com/tianhuasun/promptops-aws-startup-launchpad

## Future Roadmap

- Add an AWS CDK variant.
- Add a GitHub Actions workflow generator with manual approval gates.
- Add a multi-region architecture option with cost and reliability tradeoffs.
- Add a Well-Architected review checklist generated from the prompt output.
- Prepare a public prompt library version after review feedback.
