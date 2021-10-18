class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      render :index
    end
  end


  def edit
    @address = Address.find(params[:id])
  end


  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render　edit
    end
  end

  def destroy
   @address = Address.find_by(params[:id])
   @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end

end
