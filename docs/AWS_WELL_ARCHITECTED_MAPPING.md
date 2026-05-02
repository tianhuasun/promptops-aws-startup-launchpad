# AWS Well-Architected Mapping

This project maps the PromptOps AWS Startup Launchpad prompt contract to the six AWS Well-Architected Framework pillars.

## Operational Excellence

- Requires a repeatable output structure.
- Uses Terraform for reviewable infrastructure changes.
- Requires local validation before deployment.
- Includes CloudWatch logs.
- Includes troubleshooting guidance.
- Includes rollback and teardown steps.
- Requires human approval before real changes.

## Security

- Prohibits real secrets in prompts, examples, commits, and outputs.
- Prohibits AWS root account usage.
- Uses Secrets Manager for sensitive runtime values.
- Keeps RDS PostgreSQL private by default.
- Prohibits database ingress from `0.0.0.0/0`.
- Keeps S3 buckets private by default.
- Recommends HTTPS and encryption.
- Requires least-privilege IAM review.

## Reliability

- Uses managed AWS services such as App Runner, RDS, S3, CloudFront, Secrets Manager, and CloudWatch.
- Requires backup retention for RDS.
- Requires rollback steps for application, infrastructure, and database changes.
- Requires Terraform plan review before changes.
- Avoids unreviewed production mutations.

## Performance Efficiency

- Uses managed services that can scale without heavy cluster management.
- Starts with right-sized MVP defaults.
- Allows future migration to ECS, EKS, Lambda, or multi-region patterns when requirements justify them.
- Encourages monitoring latency, errors, and database resource usage.

## Cost Optimization

- Defaults to low-cost architecture.
- Uses AWS Budgets in every plan.
- Avoids NAT Gateway by default.
- Uses finite CloudWatch log retention.
- Uses small RDS examples and documents upgrade triggers.
- Includes teardown guidance for demos and experiments.

## Sustainability

- Encourages managed services and right-sized resources.
- Avoids unused high-cost infrastructure.
- Includes teardown instructions to remove short-lived demo environments.
- Encourages finite log retention and review of resource utilization.
