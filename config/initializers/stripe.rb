Rails.configuration.stripe = {
secret_key: Rails.application.secrets.stripe_test_secret_key,
publishable_key: Rails.application.secrets.stripe_public_key
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]