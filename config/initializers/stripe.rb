Rails.configuration.stripe = {
        :publishable_key => ENV['STRIPE_PK'] || "pk_test_4ZpScWJ0Xt1IeESh5zi485cW",
        :secret_key      => ENV['STRIPE_SK'] || "sk_test_4ZpSzFOp6MDpKjXsq8CVZ8Dc",
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
