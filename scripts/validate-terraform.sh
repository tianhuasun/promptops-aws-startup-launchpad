#!/usr/bin/env bash
set -u

# 中文注释：Terraform 校验只做本地格式检查；不执行 init、plan、apply，也不会创建 AWS 资源。
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

# 中文注释：如果本机没有 Terraform，按参赛要求友好跳过，不让整个项目失败。
if ! command -v terraform >/dev/null 2>&1; then
  echo "[terraform] Terraform is not installed. Terraform validation skipped."
  echo "[terraform] Install Terraform to run: terraform fmt -check -recursive terraform"
  exit 0
fi

echo "[terraform] Terraform found: $(terraform version -json 2>/dev/null | head -c 80 || terraform version | head -n 1)"
echo "[terraform] Running terraform fmt -check on terraform/modules and terraform/examples"

# 中文注释：只检查 modules 和 examples 目录的格式，不读取 tfvars 中的真实值。
terraform fmt -check -recursive terraform/modules terraform/examples
status=$?

if [[ "$status" -eq 0 ]]; then
  echo "[terraform] Terraform formatting validation passed"
  exit 0
fi

echo "[terraform] Terraform formatting validation failed"
exit "$status"
