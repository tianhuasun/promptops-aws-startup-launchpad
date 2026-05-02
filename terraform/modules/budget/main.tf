resource "aws_budgets_budget" "monthly" {
  name        = "${var.project_name}-${var.environment}-monthly-budget"
  budget_type = "COST"
  limit_unit  = "USD"
  time_unit   = "MONTHLY"

  limit_amount = tostring(var.monthly_budget_usd)

  # 中文注释：必须把 replace-me@example.com 替换为真实可接收告警的邮箱；不要在仓库中提交个人敏感信息。
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.alert_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.alert_email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.alert_email]
  }
}
