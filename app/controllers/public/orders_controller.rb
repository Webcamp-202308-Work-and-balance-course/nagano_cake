class Public::OrdersController < ApplicationController
    def new
        @order = Order.new  
        @customer = Customer.find(current_customer.id)
        
    end 
    
    def confirm
      @order = Order.new(order_params)
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
      
      
      
      
      #binding.pry #デバッグ用 Gem である「pry-byebug」を用いて支払い方法のデータが@order に格納されているかを確認する
      #@order.postal_code = current_customer.shopping_postal_code
      #@order.address = current_customer.shopping_address
      #@order.name = current_customer.shopping_name
      # @order.name = current_customer.first_name + current_customer.last_name 
    end 
    
    def thanks
    end 
    
    def create
    end 
    
    def index
    end 
    
    def show
    end
    
    private
    def order_params
      params.require(:order).permit(:payment_method, :address_id, :shopping_postal_code, :shopping_address, :shopping_name)
    end

end
