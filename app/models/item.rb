class Item < ApplicationRecord
 has_one_attached :item_image 
 has_many :cart_items
 has_many :orderedproduct
 validates :excluding_tax, presence: true
 
 # 消費税を求めるメソッド
def with_tax_price
  (excluding_tax * 1.08).floor
end
 
    
        
    
end
