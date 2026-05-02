# 2-3 Minute Demo Script

Use this as a direct voiceover script for the DoraHacks demo recording. The demo should show local files only and should not create AWS resources.

## 0:00-0:10 Opening

Hi, this is PromptOps AWS Startup Launchpad, my submission for the DoraHacks AWS Prompt the Planet Challenge.

It is not a chatbot or a web demo. It is a production-ready AWS prompt kit that helps founders and developers use AI coding agents to generate secure, cost-aware, human-reviewable AWS MVP infrastructure plans.

## 0:10-0:30 README

I am starting in the README.

The first section explains the project in 30 seconds: the main artifact is the master prompt, the primary use case is a Next.js, FastAPI, and PostgreSQL MVP on AWS, and the target users are startup founders, indie hackers, student builders, and AI coding agent users.

The README also shows what is inside the repository: prompt files, expected outputs, Terraform examples, documentation, tests, and local validation scripts.

## 0:30-0:55 Master Prompt

Now I am opening `prompt/master-prompt.md`.

This is the core challenge artifact. It can be copied verbatim into an AI coding agent.

The prompt defines the role, mission, use case, prerequisites, input requirements, assumptions policy, output contract, Terraform generation rules, security rules, cost rules, observability requirements, rollback rules, troubleshooting rules, AWS Well-Architected alignment, and human approval gates.

The important point is that the agent is not allowed to ask for real AWS secret keys, invent AWS Account IDs or ARNs, expose the database publicly, skip budgets, skip CloudWatch logs, or claim deployment success without evidence.

## 0:55-1:10 User Input Template

Next I am opening `prompt/user-input-template.md`.

This is what a founder fills in: project name, frontend framework, backend framework, database, AWS region, monthly budget, expected users, domain placeholder, CI/CD needs, auth needs, compliance level, deployment mode, preferred runtime, observability level, and teardown requirements.

It explicitly tells users not to include AWS keys, tokens, passwords, private certificates, or real `.env` contents.

## 1:10-1:30 Expected Output

Now I am opening the expected output for the main example under `examples/nextjs-fastapi-postgres/expected-output`.

This shows the kind of answer the prompt is designed to produce: an executive summary, assumptions, architecture, service selection rationale, security baseline, cost controls, rollback plan, troubleshooting guide, and validation checklist.

The expected output is a reviewable AWS launch package, not a claim that anything has already been deployed.

## 1:30-1:55 Terraform Example

Now I am opening `terraform/examples/nextjs-fastapi-postgres/main.tf`.

This composed example wires together the modules for networking, AWS Budgets, CloudWatch, Secrets Manager, S3, CloudFront, RDS PostgreSQL, and App Runner.

The database is private by default. S3 is private by default. Runtime secrets are referenced by Secrets Manager ARN, not written as plaintext. The example also avoids NAT Gateway by default to reduce surprise cost for small MVPs.

## 1:55-2:15 Safety Rules

Next I am showing `prompt/safety-rules.md` and `docs/SECURITY_BASELINE.md`.

The safety model is simple: no real secrets, no root account, no public database by default, no `0.0.0.0/0` database ingress, no hardcoded passwords, no fake AWS identifiers, and no real deployment without a human approval gate.

## 2:15-2:30 Cost Control

Now I am showing `docs/COST_CONTROL.md`.

Every generated plan must include AWS Budgets. The prompt also requires finite log retention, small MVP-friendly defaults, NAT Gateway cost warnings, teardown instructions, and a clear reminder that cost estimates are planning ranges, not billing guarantees.

## 2:30-2:45 Validation And Test Result

Finally, I am showing the validation scripts.

The command is:

```bash
bash scripts/test-all.sh
```

It checks required documents, master prompt sections, README challenge alignment, and DoraHacks submission copy. If Terraform is not installed, Terraform formatting validation is skipped with a clear message instead of pretending it passed.

## 2:45-3:00 Closing CTA

PromptOps AWS Startup Launchpad helps builders move from an MVP idea to a structured AWS infrastructure plan without skipping security, cost control, rollback, or human review.

For DoraHacks judges, the fastest review path is: read the README, copy the master prompt, inspect the expected output, and run the local validation script. No real AWS resources are created during this demo.
