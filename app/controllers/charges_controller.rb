class ChargesController < ApplicationController

  def create
    # Amount in cents
    @amount = params[:amount] 

    Charge.create(name: params[:name], amount: BigDecimal(params[:amount]), stripe_token: params[:stripeToken])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  def success; end
end
