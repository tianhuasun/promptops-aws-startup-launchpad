# Evaluation Criteria

Use this rubric to evaluate AI output generated with PromptOps AWS Startup Launchpad.

## Clarity

- Is the output organized in the required sections?
- Are assumptions explicit?
- Can a founder understand the plan in a few minutes?

## Actionability

- Are deployment steps concrete?
- Are validation steps provided?
- Are placeholders clearly marked?
- Are next steps obvious?

## Production Readiness

- Is Terraform or IaC included?
- Are environments and variables considered?
- Are rollback and teardown steps included?
- Are logs, budgets, and secrets addressed?

## AWS Best Practice Alignment

- Does the output align with AWS Well-Architected pillars?
- Are managed services used appropriately?
- Are architecture tradeoffs explained?

## Security

- Are secrets excluded?
- Is the root account prohibited?
- Is the database private?
- Is least privilege discussed?
- Is HTTPS considered?

## Cost Control

- Is a monthly cost estimate included?
- Are AWS Budgets included?
- Is NAT Gateway cost risk addressed?
- Are logs finite retention?
- Are MVP-sized resources used?

## Reproducibility

- Can another reviewer follow the same steps?
- Is the Terraform structure stable?
- Are validation commands included?
- Are unknown account-specific values written as `TODO`?

## Troubleshooting Quality

- Are common AWS and Terraform issues covered?
- Does each troubleshooting item include likely cause and remediation?
- Are unsafe shortcuts avoided?

## Prompt Completeness

- Does the master prompt include role, mission, input requirements, assumptions, output contract, generation rules, safety boundaries, and final checklist?
- Is the prompt complete and verbatim?

## Human Approval Safety

- Are all real deployment steps gated?
- Are billable actions clearly marked?
- Are destructive actions clearly marked?
- Does the output avoid claiming resources were deployed when they were not?
