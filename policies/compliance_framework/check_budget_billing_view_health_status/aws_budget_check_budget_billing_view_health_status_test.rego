package compliance_framework.check_budget_billing_view_health_status

import data.compliance_framework.check_budget_billing_view_health_status as policy

test_budget_billing_view_health_status_healthy_ok if {
	inp := {"BudgetName": "Test Budget", "HealthStatus": {"Status": "HEALTHY"}}

	v := count(policy.violation) with input as inp
	v == 0
}

test_budget_billing_view_health_status_healthy_violation if {
	inp := {"BudgetName": "Test Budget", "HealthStatus": {"Status": "UNHEALTHY"}}

	v := count(policy.violation) with input as inp
	v == 1
}
