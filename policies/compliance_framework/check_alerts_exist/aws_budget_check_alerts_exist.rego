package compliance_framework.check_alerts_exist

violation[{}] if {
	not input.Alerts
}

violation[{}] if {
	count(input.Alerts) < 1
}

title := "AWS account's budget has alerts"
description := "Budgets must have at least one alert."
remarks := "Not having alerts for budgets can create unexpected costs."
