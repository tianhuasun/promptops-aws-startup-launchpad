# User Input Template

Copy this template into your AI coding agent and fill in only non-secret values.

```yaml
project_name: promptops-demo
project_description: "A startup MVP with a Next.js frontend, FastAPI backend, PostgreSQL database, and private file assets."
frontend_framework: Next.js
backend_framework: FastAPI
database: PostgreSQL
target_region: us-east-1
monthly_budget_usd: 50
expected_users: "100 beta users in the first month"
domain_name: example.com
ci_cd_required: true
auth_required: true
file_upload_required: true
compliance_level: "baseline startup security, no regulated workloads yet"
deployment_mode: "development MVP first, production-ready structure"
preferred_runtime: "AWS App Runner"
observability_level: "basic CloudWatch logs, budget alerts, service health checks"
teardown_required: true
notes: "Avoid NAT Gateway unless clearly justified. Keep database private. Use placeholders for all real AWS identifiers."
```

## Do Not Include

- AWS access keys
- AWS secret keys
- Session tokens
- Database passwords
- Private certificates
- OAuth client secrets
- Real `.env` contents
- Real production account IDs
- Real ARNs
