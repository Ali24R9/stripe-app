class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @amount = params[:amount]
    @customer = Customer.new(customer_params)
    if @amount == nil || !@customer.save
      @country = params[:country]
      @subregion = params[:subregion]
      flash.now[:notice] = "One or more fields are empty"
      render "new"
    else
      render new_charge_path
    end
  end

  def subregion_select
    @parent_region = params[:parent_region]
    respond_to do |format|
      format.js
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :country, :subregion, :zip_code, :email, :phone)
  end
end