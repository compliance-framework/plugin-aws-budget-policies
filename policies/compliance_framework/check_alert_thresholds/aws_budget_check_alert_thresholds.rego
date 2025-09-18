package compliance_framework.check_alert_thresholds

violation[{}] if {
	every alert in input.Alerts {
		alert.Threshold == 0
	}
}

title := "AWS account's budget alerts are sensible"
description := "Budgets must have at least one sensible alert, that is, an alert with threshold greater than zero."
remarks := "Not having at least one sensible alert for a budget can create unexpected costs."
