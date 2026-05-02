# Cost Control

## Default Low-Cost Principle

The default architecture should be the lowest-cost option that still satisfies a secure MVP launch. The prompt prefers managed services and simple topology over complex infrastructure.

## Free Tier And Low-Cost Bias

Where practical, use services and instance sizes that are friendly to small MVPs. Examples include App Runner for small containers, small RDS instance classes, S3, CloudFront, and finite log retention.

## AWS Budgets

Every generated plan must include AWS Budgets with clear alert thresholds, commonly 50%, 80%, and 100% of the monthly budget.

## Avoid NAT Gateway Surprise Cost

NAT Gateway can create ongoing hourly and data processing charges. This kit avoids NAT Gateway by default. Add it only when private workloads require outbound internet access and the user explicitly accepts the cost.

## Avoid Oversized RDS

Start with small RDS instance classes for development and MVP workloads. Increase size only when metrics show CPU, memory, storage, or connection pressure.

## Avoid Long Log Retention

CloudWatch logs should use finite retention. The default example uses 14 days. Production teams can increase retention based on compliance requirements.

## Teardown Instructions

For demos and non-production experiments:

1. Confirm the target AWS account and region.
2. Export any data that must be retained.
3. Review `terraform plan -destroy`.
4. Get human approval.
5. Run `terraform destroy`.
6. Confirm that budgets, RDS, S3, App Runner, and CloudFront resources are gone or intentionally retained.

## Cost Review Checklist

- [ ] Monthly budget is set.
- [ ] Budget alert email is real before deployment.
- [ ] NAT Gateway is absent or explicitly justified.
- [ ] RDS instance size is appropriate.
- [ ] Log retention is finite.
- [ ] CloudFront and S3 usage is understood.
- [ ] App Runner scaling assumptions are documented.
- [ ] Teardown path is available for demos.
