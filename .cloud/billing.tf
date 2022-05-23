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

# Can't get the below to work as the TF service account needs to have a billing
# permission at the organisation level.
# resource "google_billing_budget" "budget" {
#   billing_account = var.gcp_billing_account_id
#   display_name = "Billing Budget"
#   amount {
#     specified_amount {
#       currency_code = "GBP"
#       units = "10"
#     }
#   }
#   threshold_rules {
#       threshold_percent =  0.5
#   }
#   threshold_rules {
#     threshold_percent = 1.0
#   }
#   threshold_rules {
#     threshold_percent = 1.0
#     spend_basis       = "FORECASTED_SPEND"
#   }
#   all_updates_rule {
#     monitoring_notification_channels = [
#       google_monitoring_notification_channel.notification_channel.id,
#     ]
#     disable_default_iam_recipients = true
#   }
# }

resource "google_monitoring_notification_channel" "notification_channel" {
  display_name = "Billing Notification Channel"
  type         = "email"

  labels = {
    email_address = var.email_address
  }
}