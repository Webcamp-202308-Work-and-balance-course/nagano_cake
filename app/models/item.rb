class Item < ApplicationRecord
 has_one_attached :item_image 
 has_many :cart_items
 validates :excluding_tax, presence: true
 
    def new
        @item_image = Item.new
        @item = Item.new  
    end 
    
    
private
    def item_params
        params.require(:items).permit(:title, :body, :item_image)  
    end    
    
        
    
end
