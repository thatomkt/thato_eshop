if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secrete_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_zbas1IK5N7gb2FxMHcIc6M5y',
    :secrete_key => 'sk_test_eHqkVTGZfiUSVGtPgYy2hccx',
  }
end

Stripe.api_key = Rails.configuration.stripe[:secrete_key]