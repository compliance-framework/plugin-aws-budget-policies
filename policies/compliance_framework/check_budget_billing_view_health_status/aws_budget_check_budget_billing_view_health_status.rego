package compliance_framework.check_budget_billing_view_health_status

violation[{}] if {
	not input.Budget.HealthStatus
}

violation[{}] if {
	not input.Budget.HealthStatus.Status
}

violation[{}] if {
	not input.Budget.HealthStatus.Status == "HEALTHY"
}

title := "The budget's associated billing view's health status is healthy"
description := "The billing view associated with the budget should be healthy"
remarks := "Not having a healthy billing view associated with the budget can create unexpected costs."
