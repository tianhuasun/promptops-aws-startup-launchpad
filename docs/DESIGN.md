# Design

## Prompt Kit Design Philosophy

PromptOps AWS Startup Launchpad treats cloud generation as a controlled engineering workflow, not a one-shot text response. The master prompt defines a role, mission, input contract, assumptions policy, output contract, hard safety rules, cost rules, observability requirements, rollback rules, troubleshooting requirements, and final validation checklist.

The goal is to make an AI coding agent produce something a human can review before using AWS. The agent should never jump from product idea to real resource creation without a plan, cost review, and human approval.

## Why Next.js + FastAPI + PostgreSQL

This stack is common for early-stage products:

- Next.js gives startup teams a productive frontend framework.
- FastAPI is lightweight, typed, and easy for AI coding agents to generate and test.
- PostgreSQL is a familiar relational database for SaaS MVPs.

Because many founders understand this application stack better than AWS infrastructure, it is a good target for a prompt kit that turns product requirements into reviewable cloud architecture.

## Why App Runner

AWS App Runner is the default runtime because it is simpler than ECS or EKS for many MVPs. It supports containerized services, managed scaling, HTTPS endpoints, and a smaller operational surface.

The prompt still allows ECS, EKS, Lambda, or other services when the user has requirements that justify the complexity.

## Why S3 And CloudFront

S3 and CloudFront are a reliable default for static assets and frontend distribution. The kit requires private buckets and CloudFront Origin Access Control so the bucket does not need to be public.

## Why RDS PostgreSQL

RDS PostgreSQL is a managed relational database with backups, encryption, and operational maturity. The prompt forces it into private subnets by default and prohibits `0.0.0.0/0` database ingress.

## Why Secrets Manager

Secrets Manager prevents database passwords, API keys, and signing secrets from being hardcoded into Terraform or application code. The Terraform modules output secret ARNs only, not secret values.

## Why CloudWatch

CloudWatch logs are required so a generated deployment has a basic operational trail. The kit also requires finite retention to limit unnecessary storage cost.

## Why AWS Budgets

AWS Budgets is mandatory because a safe startup launch plan must include spend visibility. The prompt treats budget alerts as part of the architecture, not an optional afterthought.

## Avoiding AI Hallucination

The prompt explicitly prohibits fabricated:

- AWS Account IDs
- ARNs
- CloudFront domains
- Route 53 Hosted Zone IDs
- ACM certificate ARNs
- ECR repository URLs
- App Runner service URLs
- Demo URLs

Unknown values must be marked clearly instead of being invented. This keeps generated output auditable.

## Keeping Output Reviewable

The output contract requires fixed sections: assumptions, architecture, service rationale, Terraform plan, deployment steps, rollback, security baseline, cost estimate, budget guardrail, observability, troubleshooting, validation, and next steps.

This predictable structure helps reviewers compare agent output against a checklist instead of reading free-form cloud advice.

## Why This Is A Production Prompt Kit

An ordinary prompt asks for an answer. This kit defines a controlled cloud delivery protocol:

- Complete input schema
- Strict output schema
- Security refusal rules
- Cost optimization rules
- Terraform generation rules
- Human approval gates
- Validation scripts
- Example expected outputs
- Well-Architected mapping
- DoraHacks submission copy

That makes it reusable for real AWS planning while staying safe for local review and open-source publication.
