# Expected Output: Serverless API Architecture

## Executive Summary

This serverless MVP uses Lambda and DynamoDB to minimize operational overhead. It is suitable for APIs with unpredictable traffic and simple access patterns.

## Architecture

```text
Client
  -> API Gateway or Lambda Function URL
    -> Lambda function
      -> DynamoDB table
      -> Secrets Manager if secrets are required

Operations:
  -> CloudWatch logs
  -> AWS Budgets
```

## Service Selection

- Lambda: low-operations compute and pay-per-use pricing.
- DynamoDB: managed NoSQL database with simple scaling.
- API Gateway: managed API entrypoint when routing, auth, or throttling is needed.
- Secrets Manager: secure secret storage.
- CloudWatch: logs and metrics.
- AWS Budgets: cost guardrails.

## Security Baseline

- Least-privilege Lambda IAM role.
- No plaintext secrets in code.
- CloudWatch logs enabled.
- Budget alerts configured.
- No fake ARNs or deployment URLs.
