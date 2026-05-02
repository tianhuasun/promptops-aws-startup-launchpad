#!/usr/bin/env bash
set -u

# 中文注释：只检查本地文档和 Prompt 关键章节，不访问云端，也不读取任何真实密钥。
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

failures=0

info() {
  printf '[docs] %s\n' "$1"
}

require_file() {
  local path="$1"
  if [[ -f "$path" ]]; then
    info "OK file exists: $path"
  else
    info "FAIL missing file: $path"
    failures=$((failures + 1))
  fi
}

require_text() {
  local path="$1"
  local pattern="$2"
  local label="$3"
  if grep -qi "$pattern" "$path"; then
    info "OK $label"
  else
    info "FAIL $label"
    failures=$((failures + 1))
  fi
}

required_files=(
  "README.md"
  "README_CN.md"
  "LICENSE"
  ".gitignore"
  ".env.example"
  "terraform.tfvars.example"
  "prompt/master-prompt.md"
  "prompt/system-prompt.md"
  "prompt/user-input-template.md"
  "prompt/output-schema.md"
  "prompt/validation-checklist.md"
  "prompt/safety-rules.md"
  "docs/DESIGN.md"
  "docs/AWS_WELL_ARCHITECTED_MAPPING.md"
  "docs/SECURITY_BASELINE.md"
  "docs/COST_CONTROL.md"
  "docs/TROUBLESHOOTING.md"
  "docs/DEMO_SCRIPT.md"
  "docs/HACKATHON_SUBMISSION.md"
  "docs/EVALUATION.md"
  "docs/ROADMAP.md"
  "tests/prompt-evaluation-cases.md"
  "tests/expected-output-checklist.md"
  "tests/terraform-static-validation.md"
)

# 中文注释：必需文件检查用于保证参赛包不是单一 README，而是完整 Prompt Kit。
info "Checking required files"
for file in "${required_files[@]}"; do
  require_file "$file"
done

# 中文注释：核心 master prompt 必须包含评审要求的结构化章节。
info "Checking master prompt sections"
require_text "prompt/master-prompt.md" "^## Role" "master prompt has Role"
require_text "prompt/master-prompt.md" "^## Mission" "master prompt has Mission"
require_text "prompt/master-prompt.md" "^## Use Case" "master prompt has use case"
require_text "prompt/master-prompt.md" "^## Prerequisites" "master prompt has prerequisites"
require_text "prompt/master-prompt.md" "^## Expected Outcome" "master prompt has expected outcome"
require_text "prompt/master-prompt.md" "Input Requirements" "master prompt has input requirements"
require_text "prompt/master-prompt.md" "Clarifying Questions" "master prompt has clarifying questions"
require_text "prompt/master-prompt.md" "Assumptions Policy" "master prompt has assumptions policy"
require_text "prompt/master-prompt.md" "Output Contract" "master prompt has output contract"
require_text "prompt/master-prompt.md" "Terraform Generation Rules" "master prompt has Terraform rules"
require_text "prompt/master-prompt.md" "Security Rules" "master prompt has security rules"
require_text "prompt/master-prompt.md" "Cost Control Rules" "master prompt has cost rules"
require_text "prompt/master-prompt.md" "AWS Well-Architected Alignment" "master prompt has Well-Architected alignment"
require_text "prompt/master-prompt.md" "Human Confirmation Gates" "master prompt has human approval gates"
require_text "prompt/master-prompt.md" "Final Validation Checklist" "master prompt has final validation checklist"

# 中文注释：README 必须让评委快速看到 hackathon fit、安全、成本、校验和 Well-Architected 对齐。
info "Checking README challenge alignment"
require_text "README.md" "Hackathon Fit" "README includes hackathon fit"
require_text "README.md" "Safety Model" "README includes safety"
require_text "README.md" "Cost Control Model" "README includes cost"
require_text "README.md" "Validation Checklist" "README includes validation"
require_text "README.md" "Well-Architected" "README includes well-architected"

# 中文注释：DoraHacks 提交文案必须包含可直接复制的核心字段。
info "Checking DoraHacks submission copy"
require_text "docs/HACKATHON_SUBMISSION.md" "Project Name" "submission has Project Name"
require_text "docs/HACKATHON_SUBMISSION.md" "One-Liner" "submission has One-liner"
require_text "docs/HACKATHON_SUBMISSION.md" "Problem" "submission has Problem"
require_text "docs/HACKATHON_SUBMISSION.md" "Solution" "submission has Solution"
require_text "docs/HACKATHON_SUBMISSION.md" "Demo Instructions" "submission has Demo instructions"

if [[ "$failures" -eq 0 ]]; then
  info "Documentation validation passed"
  exit 0
fi

info "Documentation validation failed with $failures issue(s)"
exit 1
