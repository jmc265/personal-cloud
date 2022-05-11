resource "azurerm_consumption_budget_subscription" "budget" {
  name            = "${var.short_prefix}-budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 10
  time_grain = "Monthly"

  time_period {
    start_date = "2022-05-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = 50.0    # This is percent of the budget defined above
    operator  = "GreaterThan"

    contact_emails = [
      var.email_address,
    ]
  }
}