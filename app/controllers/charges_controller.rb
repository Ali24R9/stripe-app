class ChargesController < ApplicationController

  def index
    @user = User.new
  end

  def subregion_select
    @parent_region = params[:parent_region]
    respond_to do |format|
      format.js
    end
  end

  def submit

  end

  def create
    # Amount in cents
    #money gem converts the amount given to cents when saved, so use dollar amount
    local_charge = Charge.create(name: params[:name], amount: params[:amount], stripe_token: params[:stripeToken])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )
    #stripe gem needs cents, so params[:amount] must be converted before this
    amount_cents = local_charge.amount.cents 

    charge = Stripe::Charge.create(
      :customer    => customer.id,
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
