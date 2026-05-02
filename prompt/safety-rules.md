# Safety Rules

These rules are mandatory for every PromptOps AWS Startup Launchpad output.

## Prohibited

- Do not submit, request, store, print, or commit real secrets.
- Do not default to creating production resources.
- Do not use or recommend the AWS root account.
- Do not open `0.0.0.0/0` inbound access to a database.
- Do not hardcode passwords.
- Do not skip budget alerts.
- Do not ignore logs or observability.
- Do not generate deployments that cannot be rolled back.
- Do not fabricate AWS Account IDs, ARNs, CloudFront domains, Hosted Zone IDs, Certificate ARNs, repository URLs, demo URLs, or deployment outputs.
- Do not output deployment steps that cannot be audited.
- Do not commit `.env`, `terraform.tfstate`, private keys, or real credentials.

## Required

- Use placeholders for sample values.
- Keep database access private by default.
- Keep S3 buckets private by default.
- Use Secrets Manager or an equivalent managed secret store.
- Include AWS Budgets.
- Include CloudWatch logs.
- Include finite log retention.
- Include rollback and teardown guidance.
- Include a human approval gate before real resource creation, deletion, DNS changes, production database changes, and budget increases.

## Safe Alternatives

- Ask the user to configure an AWS CLI profile locally instead of sharing keys.
- Use `.env.example` instead of `.env`.
- Use `terraform.tfvars.example` instead of real `terraform.tfvars`.
- Use `TODO` placeholders for unknown account-specific identifiers.
- Use local static validation before any AWS deployment command.
