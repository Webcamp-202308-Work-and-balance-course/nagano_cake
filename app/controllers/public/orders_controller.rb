class Public::OrdersController < ApplicationController
    def new
        @order = Order.new  
        @customer = Customer.find(current_customer.id)
        
    end 
    
    def confirm
        @cart_item = CartItem.find(current_customer.id)
        @order = Order.find(current_customer.id)
    end 
    
    def thanks
    end 
    
    def create
    end 
    
    def index
    end 
    
    def show
    end
end
