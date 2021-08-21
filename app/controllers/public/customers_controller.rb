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
  end

  def unsubscribe
  end
  
  
  
end
