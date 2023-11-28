class Admin::HomesController < ApplicationController
    def top
        @orders = Order.all
        #@ordered_products = OrderedProducts.all
    end 
    
    
    
end
