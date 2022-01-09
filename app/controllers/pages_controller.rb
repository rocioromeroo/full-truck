class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @freights = Freight.all
  end

  def about
  end

  def contact
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(@session.customer)
  end
end
