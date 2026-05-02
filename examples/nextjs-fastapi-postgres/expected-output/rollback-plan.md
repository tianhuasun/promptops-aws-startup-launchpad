# Expected Output: Rollback Plan

## Application Rollback

1. Identify the previous working container image tag.
2. Update the App Runner image identifier to the previous tag.
3. Run `terraform plan` or the approved deployment workflow.
4. Apply only after human approval.
5. Verify health checks and CloudWatch logs.

## Infrastructure Rollback

1. Revert the Terraform commit that introduced the infrastructure change.
2. Run `terraform fmt -check`.
3. Run `terraform plan`.
4. Review changes carefully.
5. Apply only after human approval.

## Database Rollback

1. Stop application writes if data integrity is at risk.
2. Identify the correct RDS snapshot.
3. Review data loss impact.
4. Restore only after explicit human approval.
5. Point the application to the restored database only after validation.

## Emergency Cost Stop

For non-production demos:

1. Confirm that no data must be retained.
2. Run `terraform plan -destroy`.
3. Review resources that will be deleted.
4. Get human approval.
5. Run `terraform destroy`.

Do not destroy production databases without backups and explicit approval.
