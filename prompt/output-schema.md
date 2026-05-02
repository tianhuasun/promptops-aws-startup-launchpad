# Output Schema

The AI agent response should follow this structure. Markdown is recommended for human review; JSON or YAML can be generated if the user explicitly requests machine-readable output.

```yaml
executive_summary:
  purpose: "Short summary of the proposed AWS MVP launch plan."
  target_user: "Founder, indie hacker, student builder, or developer."
  deployment_safety_note: "Statement that no real resources are created without approval."

assumptions:
  - "Explicit conservative assumptions used when input is incomplete."

architecture:
  workload_overview: "Application components and traffic flow."
  aws_services:
    frontend: "Next.js hosting path."
    backend: "FastAPI runtime path."
    database: "Private PostgreSQL path."
    static_assets: "S3 and CloudFront path."
    secrets: "Secrets Manager usage."
    logs: "CloudWatch usage."
    budget: "AWS Budgets usage."
  network_model: "VPC, public/private subnets, database access model."

service_selection:
  - service: "AWS service name"
    reason: "Why it fits the MVP."
    tradeoffs: "Cost, operational, security, or scaling tradeoffs."

terraform_files:
  directory_structure:
    - "terraform/modules/..."
  file_plan:
    - path: "terraform/examples/nextjs-fastapi-postgres/main.tf"
      purpose: "What this file should contain."
      safety_notes: "Security and cost notes."

deployment_steps:
  prerequisites:
    - "AWS CLI profile configured without sharing secrets."
    - "Terraform installed locally."
  local_validation:
    - "terraform fmt -check"
    - "terraform validate"
  human_approval_gate: "Required before terraform apply."
  apply_steps:
    - "Review plan output."
    - "Run apply only after approval."

rollback_steps:
  application_rollback:
    - "Revert container image tag or previous build."
  infrastructure_rollback:
    - "Review previous Terraform plan or revert IaC commit."
  database_rollback:
    - "Restore from snapshot only after explicit approval."
  teardown:
    - "Use terraform destroy for non-production demo resources after approval."

cost_estimate:
  monthly_range_usd: "Example: 30-80"
  major_cost_drivers:
    - "RDS instance hours"
    - "App Runner compute"
    - "CloudFront transfer"
  assumptions:
    - "Traffic and storage estimates."

budget_guardrails:
  monthly_budget_usd: 50
  alert_thresholds:
    - "50%"
    - "80%"
    - "100%"
  notification_target: "replace-me@example.com"

security_baseline:
  identity_and_access: "Least privilege IAM."
  secrets: "Secrets Manager, no hardcoded secrets."
  network: "Private database, no 0.0.0.0/0 database ingress."
  encryption: "Encryption at rest and TLS in transit."
  auditability: "CloudWatch logs and Terraform review."

observability:
  logs:
    - "App Runner logs"
    - "RDS logs where enabled"
  metrics:
    - "Request count"
    - "Error rate"
    - "Latency"
    - "Database CPU/storage"
  retention_days: 14

validation_checklist:
  - "Architecture present"
  - "Terraform plan present"
  - "Security baseline present"
  - "Cost guardrail present"
  - "Rollback present"
  - "Troubleshooting present"
  - "No fake AWS identifiers"
  - "No real secrets"
  - "Human approval gate present"

troubleshooting:
  - symptom: "Terraform init failed"
    likely_cause: "Provider/network/version issue."
    diagnostic: "terraform init -upgrade"
    remediation: "Check Terraform version and provider constraints."

next_steps:
  - "Replace placeholders with real non-secret project values."
  - "Run local validation."
  - "Review cost and security."
  - "Proceed only after human approval."
```
