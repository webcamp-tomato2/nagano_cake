class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
   #before_action :reject_inactive_customer, only: [:create]

  def show
    @user = current_customer
  end
  
  def edit
    @user = current_customer
  end 

  def update
  end 

  def withdraw
    @customer = Customer.find_by(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしておりますと見せかけてー！ありがとうございました！。"
    redirect_to root_path
  end

  def unsubscribe
    @customer = Customer.find_by(: params[:name])
  end
  
  
  
end
