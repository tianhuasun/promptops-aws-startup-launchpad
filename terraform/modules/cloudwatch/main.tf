resource "aws_cloudwatch_log_group" "app" {
  name              = "/aws/promptops/${var.project_name}/${var.environment}/app"
  retention_in_days = var.retention_days

  # 中文注释：日志保留期默认有限，避免长期保存无用日志带来持续成本。
  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-app-logs"
  })
}

resource "aws_cloudwatch_log_group" "database" {
  name              = "/aws/promptops/${var.project_name}/${var.environment}/database"
  retention_in_days = var.retention_days

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-database-logs"
  })
}

resource "aws_cloudwatch_metric_alarm" "estimated_charges_note" {
  count = var.create_placeholder_alarm ? 1 : 0

  alarm_name          = "${var.project_name}-${var.environment}-placeholder-operational-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Placeholder RDS CPU alarm. Review dimensions after the real DB identifier exists."
  treat_missing_data  = "notBreaching"

  # 中文注释：真实生产告警应补充 DBInstanceIdentifier 维度和 SNS 订阅；不要伪造资源 ID。
  tags = var.tags
}
