class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
   #before_action :reject_inactive_customer, only: [:create]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path

  end

  def withdraw
    @customer = Customer.find_by(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしておりますと見せかけてー！ありがとうございました！。"
    redirect_to root_path
  end

  def unsubscribe

  end
  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
  end

end
