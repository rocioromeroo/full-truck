class CheckoutController < ApplicationController
  def create
    @freight = Freight.find(params[:id])
    domain = 'http://localhost:3000'
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: @freight.departure + " - " + @freight.destination,
        amount: @freight.price.to_i * 100,
        currency: "usd",
        quantity: 1,
      }],
      mode: 'payment',
      success_url: domain + '/success?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: domain + '/',
    })
    respond_to do |format|
      format.js
    end
  end
end
