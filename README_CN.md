# PromptOps AWS Startup Launchpad

PromptOps AWS Startup Launchpad 是一个面向 DoraHacks AWS Prompt the Planet Challenge 的 AWS Prompt Kit。它不是普通 App、聊天机器人或网页 Demo，而是一套可复制、可审查、可开源的生产级提示词包，帮助创业者和开发者用 AI coding agent 生成安全、低成本、可回滚的 AWS MVP 基础设施方案。

## 适合人群

- 正在做 MVP 的创业者
- Indie hacker
- 学生开发者
- 会写应用但不熟 AWS 的开发者
- 使用 AI coding agent 生成基础设施方案的人

## 使用方式

1. 打开 `prompt/master-prompt.md`。
2. 把完整 prompt 复制到 AI coding agent。
3. 按 `prompt/user-input-template.md` 填写非敏感项。
4. 让 agent 输出 AWS 架构、Terraform 计划、安全基线、成本控制、回滚方案和排障手册。
5. 本地运行校验脚本。
6. 只有人工确认后，才能进入真实部署流程。

## Prompt 结构

- `prompt/master-prompt.md`：核心参赛文件，定义角色、任务、输入、输出、安全边界和校验清单。
- `prompt/system-prompt.md`：给 AI coding agent 使用的系统提示词。
- `prompt/user-input-template.md`：用户填写模板。
- `prompt/output-schema.md`：标准输出结构。
- `prompt/validation-checklist.md`：输出质量检查表。
- `prompt/safety-rules.md`：强制安全规则。

## 示例架构

默认主场景是：

- Frontend: Next.js
- Backend: FastAPI
- Database: PostgreSQL
- Runtime: AWS App Runner
- Static assets: S3
- CDN: CloudFront
- Secrets: AWS Secrets Manager
- Logs: CloudWatch
- Budget: AWS Budgets
- IaC: Terraform

数据库默认放在 private subnet，不公网暴露；S3 bucket 默认私有；预算告警和日志是必选项。

## 安全边界

- 禁止提交真实 AWS Key、OpenAI Key、token、密码、`.env`。
- 禁止使用 AWS root account。
- 禁止默认创建真实生产资源。
- 禁止让 RDS 暴露公网。
- 禁止数据库安全组开放 `0.0.0.0/0`。
- 禁止硬编码数据库密码。
- 禁止伪造 AWS Account ID、ARN、CloudFront 域名、Hosted Zone ID、Certificate ARN。
- 所有真实部署必须有人类确认门。

## 成本控制

- 默认使用低成本 MVP 方案。
- 默认使用 App Runner，而不是更复杂的 ECS/EKS。
- RDS 默认使用小规格示例。
- CloudWatch 日志设置有限保留期。
- 必须包含 AWS Budgets。
- 默认不创建 NAT Gateway，避免固定成本陷阱。
- 提供 teardown 指引，方便删除演示资源。

## 本地校验

```bash
bash scripts/validate-docs.sh
bash scripts/validate-terraform.sh
bash scripts/test-all.sh
```

这些命令只做本地静态检查，不会执行 `terraform apply`，不会创建 AWS 资源。

## 提交说明

DoraHacks 提交材料位于：

- `docs/HACKATHON_SUBMISSION.md`
- `docs/EVALUATION.md`
- `docs/JUDGE_GUIDE.md`

提交前需要人工补充：

- GitHub repo URL
- DoraHacks 项目页由 DoraHacks 提交流程生成，不作为仓库占位材料

本项目可以独立开源到 GitHub。仓库只包含示例配置和占位值，不包含真实密钥、真实账号 ID 或真实部署结果。
