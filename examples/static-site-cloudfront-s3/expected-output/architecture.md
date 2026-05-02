# Expected Output: Static Site Architecture

## Executive Summary

Host a static site using a private S3 bucket behind CloudFront. The design avoids public bucket access, uses HTTPS through CloudFront, and includes AWS Budgets for spend visibility.

## Architecture

```text
Browser
  -> CloudFront distribution
    -> Origin Access Control
      -> Private S3 bucket

Operations:
  -> AWS Budgets
  -> CloudWatch where enabled
```

## Security Baseline

- S3 public access block enabled.
- CloudFront OAC used for S3 access.
- HTTPS redirect enabled.
- No real certificate ARN is fabricated.
- No real domain or Hosted Zone ID is fabricated.

## Cost Control

- S3 and CloudFront are low-cost for small sites.
- AWS Budgets is required.
- Avoid unnecessary logging retention.
- Delete unused distributions and buckets after demos.
