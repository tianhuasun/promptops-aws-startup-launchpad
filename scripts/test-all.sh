#!/usr/bin/env bash
set -u

# 中文注释：总测试脚本串联文档检查和 Terraform 静态检查；Terraform 缺失时只提示跳过。
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

failures=0

echo "[test-all] Running documentation validation"
if bash scripts/validate-docs.sh; then
  echo "[test-all] Documentation validation passed"
else
  echo "[test-all] Documentation validation failed"
  failures=$((failures + 1))
fi

echo "[test-all] Running Terraform static validation"
# 中文注释：捕获输出是为了识别 Terraform validation skipped，并把它作为允许状态处理。
terraform_output="$(bash scripts/validate-terraform.sh 2>&1)"
terraform_status=$?
printf '%s\n' "$terraform_output"

if printf '%s\n' "$terraform_output" | grep -q "Terraform validation skipped"; then
  echo "[test-all] Terraform validation skipped"
elif [[ "$terraform_status" -eq 0 ]]; then
  echo "[test-all] Terraform validation passed"
else
  echo "[test-all] Terraform validation failed"
  failures=$((failures + 1))
fi

if [[ "$failures" -eq 0 ]]; then
  echo "[test-all] All available validations passed"
  exit 0
fi

echo "[test-all] Validation failed with $failures issue(s)"
exit 1
