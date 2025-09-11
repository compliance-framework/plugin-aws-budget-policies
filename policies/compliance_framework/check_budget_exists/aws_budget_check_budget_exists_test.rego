package compliance_framework.check_budget_exists

import data.compliance_framework.check_budget_exists as policy

test_budget_exists_ok if {
	inp := {"BudgetName": "Test Budget"}

	v := count(policy.violation) with input as inp
	v == 0
}

test_budget_exists_violation if {
	inp := {}

	v := count(policy.violation) with input as inp
	v == 1
}
