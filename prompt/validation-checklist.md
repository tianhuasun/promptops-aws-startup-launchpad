# Prompt Output Validation Checklist

Use this checklist to judge whether an AI-generated AWS launch package is acceptable.

## Architecture

- [ ] Complete target architecture is present.
- [ ] User input is reflected in the architecture.
- [ ] AWS service selection is justified.
- [ ] App Runner, S3, CloudFront, RDS, Secrets Manager, CloudWatch, and Budgets are considered when relevant.
- [ ] AWS Well-Architected pillars are addressed.

## Infrastructure As Code

- [ ] IaC is present.
- [ ] Terraform directory structure or file contents are included.
- [ ] Terraform variables avoid hardcoded environment-specific values.
- [ ] Terraform outputs do not expose secret values.
- [ ] A `terraform fmt` and validation path is included.
- [ ] `terraform apply` is gated by human approval.

## Security

- [ ] Security baseline is present.
- [ ] No real secrets are requested.
- [ ] No real secrets are printed.
- [ ] No fake AWS resource IDs are invented.
- [ ] Least privilege principle is followed.
- [ ] Root account usage is prohibited.
- [ ] Database is not publicly exposed by default.
- [ ] Database security group does not allow `0.0.0.0/0`.
- [ ] Secrets Manager or equivalent secret storage is used.
- [ ] HTTPS and encryption are considered.

## Cost Control

- [ ] Cost control section is present.
- [ ] AWS Budgets is included.
- [ ] Budget alert email uses a placeholder unless provided by the user.
- [ ] NAT Gateway cost risk is discussed if relevant.
- [ ] RDS size is appropriate for an MVP.
- [ ] Log retention is finite.
- [ ] Teardown guidance is included.

## Operations

- [ ] CloudWatch logs are included.
- [ ] Observability plan is present.
- [ ] Rollback plan is present.
- [ ] Troubleshooting guide is present.
- [ ] Human approval gate is present before real deployment.
- [ ] Validation checklist is included in the final output.

## Safety Review

- [ ] The output does not claim resources were deployed unless they actually were.
- [ ] The output does not fabricate Demo URLs, GitHub URLs, ARNs, CloudFront domains, Account IDs, Hosted Zone IDs, or Certificate ARNs.
- [ ] Unknown values are marked as `TODO`.
- [ ] Deployment steps are auditable and reversible.
