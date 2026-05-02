# Repository-First Review Path

Based on the public submission requirements, the core artifact is the complete prompt and supporting documentation.

This repository is structured so judges can evaluate the project directly without relying on a demo video. A video is optional unless the submission form requires it.

## Where To Review The Core Artifact

The complete prompt is in:

- `prompt/master-prompt.md`

It is designed to be copied verbatim into an AI coding agent.

## Where To Review Context And Documentation

Context and documentation are in:

- `prompt/`
- `docs/`
- `examples/`

These files explain the use case, input template, output schema, safety rules, expected outputs, troubleshooting, cost controls, and submission copy.

## Where To Review AWS Services And Best Practices

AWS service and best-practice mapping is in:

- `terraform/`
- `docs/AWS_WELL_ARCHITECTED_MAPPING.md`
- `docs/SECURITY_BASELINE.md`
- `docs/COST_CONTROL.md`

The main AWS scenario covers App Runner, RDS PostgreSQL, S3, CloudFront, Secrets Manager, CloudWatch, AWS Budgets, VPC networking, and Terraform.

## How To Validate Locally

Run:

```bash
bash scripts/test-all.sh
```

Validation does not create AWS resources.

No real AWS credentials are required.

## Safety Note

This is a repository-first review path. It does not claim that a demo video is unnecessary for every submission flow. If the DoraHacks submission form requests a video, use `docs/DEMO_SCRIPT.md` to record one without creating real AWS resources.
