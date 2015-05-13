class ChargesController < ApplicationController

  def submit
    @customer = Customer.new(customer_params)
    if !@customer.valid?
      flash[:notice] = "Please fix these errors"
      render "index"
    else
      redirect_to new_charge_path
    end
  end

  def create
    # Amount in cents
    #money gem converts the amount given to cents when saved, so use dollar amount
    local_charge = Charge.create(name: params[:name], amount: params[:amount], stripe_token: params[:stripeToken])

    stripe_customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )
    #stripe gem needs cents, so params[:amount] must be converted before this
    amount_cents = local_charge.amount.cents 

    charge = Stripe::Charge.create(
      :customer    => stripe_customer.id,
      :amount      => amount_cents,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @amount = local_charge.amount.format

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
