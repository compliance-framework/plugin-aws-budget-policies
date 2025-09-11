package compliance_framework.check_alert_thresholds

import data.compliance_framework.check_alert_thresholds as policy

test_alert_thresholds_ok if {
	inp := {"BudgetName": "Test Budget", "Alerts": [{"ComparisonOperator": "GREATER_THAN", "NotificationType": "ACTUAL", "Threshold": 80, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}]}

	v := count(policy.violation) with input as inp
	v == 0
}

test_many_alert_thresholds_ok if {
	inp := {"BudgetName": "Test Budget", "Alerts": [{"ComparisonOperator": "GREATER_THAN", "NotificationType": "FORECAST", "Threshold": 90, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}, {"ComparisonOperator": "GREATER_THAN", "NotificationType": "ACTUAL", "Threshold": 0, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}]}

	v := count(policy.violation) with input as inp
	v == 0
}

test_alert_thresholds_violation if {
	inp := {"BudgetName": "Test Budget", "Alerts": [{"ComparisonOperator": "GREATER_THAN", "NotificationType": "ACTUAL", "Threshold": 0, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}]}

	v := count(policy.violation) with input as inp
	v == 1
}

test_many_alert_thresholds_violation if {
	inp := {"BudgetName": "Test Budget", "Alerts": [{"ComparisonOperator": "GREATER_THAN", "NotificationType": "ACTUAL", "Threshold": 0, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}, {"ComparisonOperator": "GREATER_THAN", "NotificationType": "ACTUAL", "Threshold": 0, "NotificationState": "OK", "ThresholdType": "PERCENTAGE"}]}

	v := count(policy.violation) with input as inp
	v == 1
}
