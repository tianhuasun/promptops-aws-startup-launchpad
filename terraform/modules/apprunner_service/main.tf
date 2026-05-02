resource "aws_apprunner_service" "this" {
  service_name = "${var.project_name}-${var.environment}-${var.service_name}"

  source_configuration {
    auto_deployments_enabled = var.auto_deployments_enabled

    image_repository {
      image_identifier      = var.image_identifier
      image_repository_type = var.image_repository_type

      image_configuration {
        port                          = var.port
        runtime_environment_variables = var.environment_variables
        runtime_environment_secrets   = var.environment_secrets
      }
    }
  }

  instance_configuration {
    # 中文注释：MVP 默认使用较小规格控制成本；生产环境按实际吞吐和延迟再升级。
    cpu               = var.cpu
    memory            = var.memory
    instance_role_arn = var.instance_role_arn == "" ? null : var.instance_role_arn
  }

  health_check_configuration {
    protocol            = "HTTP"
    path                = var.health_check_path
    interval            = 10
    timeout             = 5
    healthy_threshold   = 1
    unhealthy_threshold = 5
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-${var.service_name}"
  })
}
