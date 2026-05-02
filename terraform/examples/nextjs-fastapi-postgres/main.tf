terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
    PromptKit   = "promptops-aws-startup-launchpad"
  }
}

module "networking" {
  source = "../../modules/networking"

  project_name = var.project_name
  environment  = var.environment

  # 中文注释：默认创建私有子网给数据库使用，不默认创建 NAT Gateway，避免低预算 MVP 产生固定成本。
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = local.common_tags
}

module "budget" {
  source = "../../modules/budget"

  project_name       = var.project_name
  environment        = var.environment
  monthly_budget_usd = var.monthly_budget_usd
  alert_email        = var.budget_alert_email
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"

  project_name   = var.project_name
  environment    = var.environment
  retention_days = var.log_retention_days
  tags           = local.common_tags
}

module "app_secret" {
  source = "../../modules/secrets_manager"

  project_name = var.project_name
  environment  = var.environment
  secret_name  = "app-runtime"

  # 中文注释：这里仅保留占位结构；真实 secret 应通过安全流程写入 Secrets Manager，不能提交到 Git。
  placeholder_secret_json = {}
  tags                    = local.common_tags
}

module "static_assets" {
  source = "../../modules/s3_static_site"

  bucket_name       = var.static_assets_bucket_name
  enable_versioning = true
  force_destroy     = false
  tags              = local.common_tags
}

module "cdn" {
  source = "../../modules/cloudfront"

  project_name                   = var.project_name
  environment                    = var.environment
  s3_bucket_regional_domain_name = module.static_assets.bucket_regional_domain_name

  # 中文注释：示例不伪造真实域名或证书 ARN；自定义域名上线前需人工补充 ACM 证书和 DNS。
  domain_aliases      = []
  acm_certificate_arn = ""
  tags                = local.common_tags
}

module "postgres" {
  source = "../../modules/rds_postgres"

  project_name                = var.project_name
  environment                 = var.environment
  private_subnet_ids          = module.networking.private_subnet_ids
  database_security_group_ids = [module.networking.database_security_group_id]
  database_name               = var.database_name
  master_username             = var.database_username
  instance_class              = var.rds_instance_class
  backup_retention_days       = var.backup_retention_days
  deletion_protection         = var.deletion_protection
  skip_final_snapshot         = var.skip_final_snapshot
  tags                        = local.common_tags
}

module "api_service" {
  source = "../../modules/apprunner_service"

  project_name     = var.project_name
  environment      = var.environment
  service_name     = "api"
  image_identifier = var.api_image_identifier
  port             = "8000"

  environment_variables = {
    AWS_REGION    = var.aws_region
    DATABASE_NAME = var.database_name
    DATABASE_HOST = module.postgres.db_instance_endpoint
    LOG_GROUP     = module.cloudwatch.app_log_group_name
  }

  # 中文注释：App Runner 只接收 Secrets Manager ARN，不在 Terraform 输出或环境变量中写入 secret 明文。
  environment_secrets = {
    APP_RUNTIME_SECRET_ARN = module.app_secret.secret_arn
    DATABASE_SECRET_ARN    = module.postgres.master_user_secret_arn
  }

  tags = local.common_tags
}
