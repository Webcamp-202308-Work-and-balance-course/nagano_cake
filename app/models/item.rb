class Item < ApplicationRecord
 has_one_attached :item_image   
 
    def new
        @item_image = Item.new
        @item = Item.new  
    end 
    
    
private
    def item_params
        params.require(:items).permit(:title, :body, :item_image)  
    end    
    
        
    
end
