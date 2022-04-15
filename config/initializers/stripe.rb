require 'stripe'


# Stripe.api_key = Rails.application.credentials[:stripe][:secret]

Rails.configuration.stripe = {
    :public => ENV['PUBLIC'],
    :secret => ENV['SECRET']

}
Stripe.api_key = Rails.configuration.stripe[:secret]