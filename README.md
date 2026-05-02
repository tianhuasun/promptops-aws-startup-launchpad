# PromptOps AWS Startup Launchpad

**DoraHacks AWS Prompt the Planet Challenge submission**

**PromptOps AWS Startup Launchpad** is a structured AWS prompt kit for planning and reviewing MVP infrastructure with an AI coding agent.

The core deliverable is [`prompt/master-prompt.md`](prompt/master-prompt.md). It guides an agent to produce an AWS architecture, Terraform plan, safety checks, cost controls, rollback steps, and troubleshooting notes for a typical startup stack.

The repository is designed for direct GitHub review. It does not require real AWS credentials, and its validation scripts do not create AWS resources.

## 30-Second Review

- **Complete Prompt:** [`prompt/master-prompt.md`](prompt/master-prompt.md)
- **Context & Documentation:** [`prompt/`](prompt), [`docs/`](docs), [`examples/`](examples)
- **AWS Services & Best Practices:** [`terraform/`](terraform), [`docs/AWS_WELL_ARCHITECTED_MAPPING.md`](docs/AWS_WELL_ARCHITECTED_MAPPING.md)
- **Judge Guide:** [`docs/JUDGE_GUIDE.md`](docs/JUDGE_GUIDE.md)
- **Repository-first Review:** [`docs/JUDGE_GUIDE.md#repository-first-review-path`](docs/JUDGE_GUIDE.md#repository-first-review-path)
- **Validation:** `bash scripts/test-all.sh`

Primary scenario: **Next.js + FastAPI + PostgreSQL on AWS**, using App Runner, RDS PostgreSQL, S3, CloudFront, Secrets Manager, CloudWatch, AWS Budgets, and Terraform.

Reviewers can evaluate the project through the repository-first path in the judge guide.

## What This Solves

AI coding agents are good at generating cloud code, but unguided prompts can produce risky infrastructure: public databases, missing budgets, hardcoded secrets, fake ARNs, unclear rollback paths, or deployment steps that cannot be audited.

PromptOps gives the agent a stricter operating contract. The output must include assumptions, AWS architecture, Terraform plans, security baselines, cost guardrails, human approval gates, rollback steps, troubleshooting tips, and AWS Well-Architected alignment.

## Quick Start For Judges

1. Open [`prompt/master-prompt.md`](prompt/master-prompt.md).
2. Copy it verbatim into an AI coding agent.
3. Fill [`prompt/user-input-template.md`](prompt/user-input-template.md) with non-secret MVP requirements.
4. Compare the result with [`examples/nextjs-fastapi-postgres/expected-output`](examples/nextjs-fastapi-postgres/expected-output).
5. Review the Terraform example in [`terraform/examples/nextjs-fastapi-postgres`](terraform/examples/nextjs-fastapi-postgres).
6. Run `bash scripts/test-all.sh` for local documentation and static validation.

No real AWS resources are created by this repository or its validation scripts.

## What's Inside

- `prompt/`: the complete prompt kit, including master prompt, system prompt, input template, output schema, validation checklist, and safety rules.
- `examples/`: expected outputs for three AWS startup scenarios.
- `terraform/`: example modules and a composed Next.js + FastAPI + PostgreSQL infrastructure plan.
- `docs/`: judge guide, design notes, Well-Architected mapping, security baseline, cost controls, troubleshooting, evaluation notes, roadmap, and DoraHacks submission copy.
- `tests/`: prompt evaluation cases and expected-output checklists.
- `scripts/`: local validation scripts that do not deploy AWS resources.

## Why It Fits AWS Startups

Startup teams often know their application stack but have less confidence in AWS infrastructure planning. This kit defaults to managed AWS services, keeps the database private, requires Secrets Manager and CloudWatch, includes AWS Budgets, avoids NAT Gateway by default for low-budget MVPs, and keeps billable or destructive actions behind a human approval gate.

## Project Overview

The kit gives an AI coding agent a strict operating model for a common startup stack:

- Next.js frontend
- FastAPI backend
- PostgreSQL database
- S3 static assets
- CloudFront CDN
- AWS Secrets Manager
- CloudWatch logs
- AWS Budgets
- Terraform IaC
- AWS App Runner as the default MVP runtime

The output is designed to be reviewed before any real AWS deployment happens. It is a proposal and generation framework, not proof that any AWS account has been deployed.

## Why This Prompt Matters

Many startup teams can build products faster than they can safely operate cloud infrastructure. AI coding agents can help, but an unguided agent may hallucinate resource IDs, skip budget alerts, expose databases, or produce deployment steps that are difficult to audit.

This prompt kit makes the agent produce a reviewable AWS launch package instead of loose cloud advice. It requires assumptions, architecture, Terraform plans, security baselines, cost guardrails, rollback steps, and troubleshooting guidance.

## Hackathon Fit

The AWS Prompt the Planet Challenge asks for complete prompts that help users accomplish real AWS tasks with clear prerequisites, use cases, expected outcomes, troubleshooting tips, and AWS best-practice alignment.

This project directly addresses that brief:

- The master prompt is complete and verbatim.
- The use case is a real AWS MVP launch workflow.
- Prerequisites, expected outputs, validation, and troubleshooting are included.
- The design maps to AWS Well-Architected Framework pillars.
- Safety and cost controls are built into the prompt contract.

## What Problem It Solves

PromptOps reduces the risk of using AI coding agents for AWS infrastructure generation by forcing the agent to:

- Use reviewable Terraform instead of vague instructions.
- Avoid real secrets and fake infrastructure identifiers.
- Keep databases private by default.
- Include AWS Budgets and CloudWatch logs.
- Choose low-cost services first.
- Add human approval gates before billable or destructive actions.
- Provide rollback and teardown instructions.

## Who Should Use It

- Startup founders launching an MVP.
- Indie hackers who know application code but not AWS deeply.
- Student builders shipping hackathon infrastructure.
- AI coding agent users who need safer cloud generation.
- Developers who want reusable AWS prompt templates.

## How To Use The Master Prompt

1. Open [`prompt/master-prompt.md`](prompt/master-prompt.md).
2. Copy it verbatim into your AI coding agent.
3. Fill in [`prompt/user-input-template.md`](prompt/user-input-template.md) with non-secret project values.
4. Ask the agent to generate an AWS MVP launch package.
5. Review the generated architecture, Terraform plan, cost estimate, security baseline, and rollback steps.
6. Run local validation before any real deployment.
7. Proceed only after the human approval gate.

## Input Template

The input template includes:

- `project_name`
- `project_description`
- `frontend_framework`
- `backend_framework`
- `database`
- `target_region`
- `monthly_budget_usd`
- `expected_users`
- `domain_name`
- `ci_cd_required`
- `auth_required`
- `file_upload_required`
- `compliance_level`
- `deployment_mode`
- `preferred_runtime`
- `observability_level`
- `teardown_required`
- `notes`

Use `.env.example` and `terraform.tfvars.example` as sample files only. Do not commit real `.env` files or secrets.

## Expected Output

The prompt requires the AI agent to return:

1. Executive summary
2. Assumptions
3. Target AWS architecture
4. Service selection rationale
5. Terraform directory structure
6. Terraform file contents or file plan
7. Deployment steps
8. Rollback steps
9. Security baseline
10. Cost estimate
11. Budget guardrail
12. Observability plan
13. Troubleshooting guide
14. Validation checklist
15. Next steps

## Example Architecture

```text
User
  -> CloudFront
    -> S3 private static assets for Next.js build output
  -> App Runner FastAPI service
    -> Secrets Manager for runtime secrets
    -> Private RDS PostgreSQL
  -> CloudWatch logs and metrics
  -> AWS Budgets monthly alerts
```

The default architecture avoids a NAT Gateway unless there is a clear reason to pay for private subnet outbound internet access.

## Terraform Example

Terraform modules are included under [`terraform/modules`](terraform/modules):

- `networking`
- `budget`
- `s3_static_site`
- `cloudfront`
- `apprunner_service`
- `rds_postgres`
- `secrets_manager`
- `cloudwatch`

The composed example is in [`terraform/examples/nextjs-fastapi-postgres`](terraform/examples/nextjs-fastapi-postgres).

Run local checks:

```bash
bash scripts/validate-docs.sh
bash scripts/validate-terraform.sh
bash scripts/test-all.sh
```

These scripts do not create AWS resources.

## Safety Model

- Never request or commit real AWS keys, OpenAI keys, tokens, passwords, or `.env` files.
- Never use the AWS root account.
- Never expose PostgreSQL publicly by default.
- Never allow `0.0.0.0/0` inbound database access.
- Never hardcode passwords.
- Never skip AWS Budgets.
- Never skip CloudWatch logs.
- Never fabricate Account IDs, ARNs, CloudFront domains, Hosted Zone IDs, or Certificate ARNs.
- Always include human approval before `terraform apply`, `terraform destroy`, DNS changes, database changes, or budget increases.

## Cost Control Model

- Use App Runner first for small containerized MVPs.
- Use small RDS instances in examples.
- Keep CloudWatch log retention finite.
- Include AWS Budgets with 50%, 80%, and 100% thresholds.
- Avoid NAT Gateway by default.
- Include teardown guidance for demos and experiments.
- Mark every potentially billable action.

## AWS Well-Architected Alignment

The kit maps its requirements to the six AWS Well-Architected pillars:

- Operational Excellence: validation, runbooks, rollback, troubleshooting.
- Security: least privilege, private database, Secrets Manager, no root account.
- Reliability: backups, rollback, review gates, reproducible IaC.
- Performance Efficiency: managed services and right-sized MVP defaults.
- Cost Optimization: budgets, small defaults, finite retention, NAT Gateway avoidance.
- Sustainability: managed services, right sizing, teardown of unused resources.

See [`docs/AWS_WELL_ARCHITECTED_MAPPING.md`](docs/AWS_WELL_ARCHITECTED_MAPPING.md).

## Validation Checklist

The prompt output is acceptable only when it includes:

- Complete architecture.
- Terraform or IaC plan.
- Security baseline.
- Cost estimate and AWS Budgets.
- CloudWatch logging.
- Rollback plan.
- Troubleshooting guide.
- No real secrets.
- No fake AWS identifiers.
- Human approval gate.

## Limitations

- This project does not deploy real AWS resources.
- Terraform examples are designed for static review and formatting validation first.
- Cost estimates are planning estimates, not AWS billing guarantees.
- Production environments still require security review, account review, and workload-specific hardening.
- The primary review path is the GitHub repository and the files linked in the judge guide.

## References

- AWS Well-Architected Framework
- AWS App Runner documentation
- Amazon RDS for PostgreSQL documentation
- Amazon S3 security best practices
- Amazon CloudFront Origin Access Control
- AWS Secrets Manager documentation
- Amazon CloudWatch documentation
- AWS Budgets documentation
- DoraHacks AWS Prompt the Planet Challenge page: https://dorahacks.io/hackathon/awsprompttheplanet/detail

## Submission Summary

PromptOps AWS Startup Launchpad is a structured AWS prompt kit for generating secure, cost-aware, reviewable MVP infrastructure plans with AI coding agents. Its master prompt, examples, Terraform modules, validation scripts, and submission copy are ready for DoraHacks review.
