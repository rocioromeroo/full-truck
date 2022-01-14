# Stripe.api_key = Rails.application.credentials.stripe[:secret]


Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.stripe[:public],
  :secret_key => Rails.application.credentials.stripe[:secret]
}
Stripe.api_key = Rails.application.credentials.stripe[:secret]
