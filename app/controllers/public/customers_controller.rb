class Public::CustomersController < ApplicationController
 
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
  end
  
  
  
end
