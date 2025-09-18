package compliance_framework.check_budget_exists

violation[{}] if {
	not input
}

violation[{}] if {
	not input.Budget.BudgetName
}

title := "AWS account has a budget"
description := "AWS Accounts must have budgets"
remarks := "Not having a budget specified can create unexpected costs."
