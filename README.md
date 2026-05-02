# PromptOps AWS Startup Launchpad

**PromptOps AWS Startup Launchpad** is a production-ready AWS Prompt Kit that helps founders and developers use AI coding agents to design, generate, validate, and deploy secure, cost-controlled AWS MVP infrastructure.

It is built for the DoraHacks AWS Prompt the Planet Challenge as a complete prompt package, not a chatbot or ordinary demo app.

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

The output is designed to be reviewed before any real AWS deployment happens.

## Why This Prompt Matters

Many startup teams can build products faster than they can safely operate cloud infrastructure. AI coding agents can help, but an unguided agent may hallucinate resource IDs, skip budget alerts, expose databases, or produce deployment steps that are difficult to audit.

This prompt kit turns the agent into a disciplined AWS launch assistant. It requires assumptions, architecture, Terraform plans, security baselines, cost guardrails, rollback steps, and troubleshooting guidance.

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

Use `.env.example` and `terraform.tfvars.example` as placeholders only. Do not commit real `.env` files or secrets.

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

## Demo Script Summary

The 3-minute demo:

1. Open this README.
2. Show the master prompt.
3. Fill the input template.
4. Show the expected output for Next.js + FastAPI + PostgreSQL.
5. Show Terraform modules.
6. Show safety and cost controls.
7. Show validation scripts.
8. Explain how this helps founders launch on AWS safely.

See [`docs/DEMO_SCRIPT.md`](docs/DEMO_SCRIPT.md).

## Limitations

- This project does not deploy real AWS resources.
- Terraform examples are designed for static review and formatting validation first.
- Cost estimates are planning estimates, not AWS billing guarantees.
- Production environments still require security review, account review, and workload-specific hardening.
- GitHub URL, demo video URL, and DoraHacks BUIDL URL are placeholders until the user publishes them.

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

PromptOps AWS Startup Launchpad is a complete AWS Prompt Kit for generating secure, cost-aware, reviewable MVP infrastructure with AI coding agents. Its master prompt, examples, Terraform modules, validation scripts, and submission copy are ready for open-source publication and DoraHacks review.
