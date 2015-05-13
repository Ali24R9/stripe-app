class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @amount = params[:amount]
    if !@customer.save
      flash[:notice] = "Please fix these errors"
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