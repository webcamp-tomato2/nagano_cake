class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.all.order(created_at: "DESC")
    end

    def show
        @order = Order.find(params[:id])
        @order.shipping_cost = 800
        #@order_detail = OrderDetail.find_by(params[:id])
        @order_details = @order.order_details
    end

    def update
        @order = Order.find(params[:id])
        @order_status = params[:order][:order_status].to_i
        @order.update(status: @order_status)

        if @order_status == 1
          @order.order_details.each do |order_detail|
          order_detail.update(making_status: 1)
          end
        end
        redirect_to admin_order_path(@order)
    end

    def cus_index
        #その注文をしたcustomer_idを持ってきたい
        @orders = Order.where(customer_id: params[:customer_id]).order(created_at: "DESC")
        #@orders = Customer.find(params[:customer_id]).orders
    end


    private

    def order_status_params
        params.require(:order).permit(:status)
    end
end
