package compliance_framework.check_alerts_exist

import data.compliance_framework.check_alerts_exist as policy

test_alerts_exist_ok if {
	inp := {"BudgetName": "Test Budget", "Alerts": [{"ComparisonOperator": "GREATER_THAN", "NotificationType": "ACTUAL", "Threshold": 80, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}]}

	v := count(policy.violation) with input as inp
	v == 0
}

test_budget_exists_no_alert_count_defined_violation if {
	inp := {"BudgetName": "Test Budget"}

	v := count(policy.violation) with input as inp
	v == 1
}

test_budget_exists_no_alerts_violation if {
	inp := {"BudgetName": "Test Budget", "Alerts": []}

	v := count(policy.violation) with input as inp
	v == 1
}
