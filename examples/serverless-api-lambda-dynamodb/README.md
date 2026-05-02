# Example: Serverless API With Lambda And DynamoDB

This example shows how the prompt kit can adapt to a serverless MVP while preserving the same safety model.

## Use Case

A developer wants a low-operations API with burst-friendly scaling and no relational database requirement.

## Expected AWS Services

- API Gateway or Lambda Function URL for HTTP entry.
- AWS Lambda for compute.
- Amazon DynamoDB for data.
- AWS Secrets Manager when secrets are needed.
- CloudWatch logs.
- AWS Budgets.

## Safety Rules

- Do not hardcode secrets in Lambda environment variables.
- Use least-privilege IAM for DynamoDB access.
- Include CloudWatch logs and budget alerts.
- Require human approval before deployment.
