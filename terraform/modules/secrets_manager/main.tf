resource "aws_secretsmanager_secret" "this" {
  name        = "${var.project_name}/${var.environment}/${var.secret_name}"
  description = var.description

  # 中文注释：这里只创建 Secret 容器；真实 secret value 应通过安全流程写入，不能提交到 Git。
  recovery_window_in_days = var.recovery_window_in_days

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-${var.secret_name}"
  })
}

resource "aws_secretsmanager_secret_version" "placeholder" {
  count = length(var.placeholder_secret_json) == 0 ? 0 : 1

  secret_id = aws_secretsmanager_secret.this.id

  # 中文注释：仅允许占位示例值；不要把真实密码、token、API key 写入 Terraform 文件或 tfvars。
  secret_string = jsonencode(var.placeholder_secret_json)
}
