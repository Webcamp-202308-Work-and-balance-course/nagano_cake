class Public::HomesController < ApplicationController
    
    def top
        @items = Item.all.limit(4)
    end 
 
     def about
     end 
end
