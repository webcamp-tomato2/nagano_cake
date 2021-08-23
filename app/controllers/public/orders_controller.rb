class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def new
        @order = Order.new
    end


    def confirm
        @order = Order.new
        @cart_items = current_customer.cart_items
        #Orderモデルに乗せてpayment_methodを持ってくる
        @order.payment_method = params[:order][:payment_method]
        #会員との紐付け
        @order.customer_id = current_customer.id
        #配送料は800円。決まっているものはコントローラで定義。
        @order.shipping_cost = 800
        if params[:order][:address_option] == "0"
            #newページから送られてきた情報をOrderモデルのカラムを使って置き換える
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
        elsif params[:order][:address_option] == "1"
            #モデルに乗ってやってきた住所（order_address_id）を数値で取得してaddressモデルから登録済みの住所を引っ張ってくる
            @sta = params[:order][:order_address_id].to_i
            @order_address_id = Address.find(@sta)
            #findで見つけてきた住所Orderモデルのカラムに置き換える
            @order.postal_code = @order_address_id.postal_code
            @order.address = @order_address_id.address
            @order.name = @order_address_id.name

        elsif params[:order][:address_option] == "2"
            @order.postal_code = params[:order][:postal_code]
            @order.address = params[:order][:order_address]
        end
    end


    def create
        @order = Order.new(order_params)
        @order.save
        redirect_to orders_thanx_path
    end


    def thanx
    end


    def index
        @orders = Order.all
    end

    def show
    end

    def order_params
        params.require(:order).permit(:postal_code, :payment_method, :order_address, :address_option)
    end
end
