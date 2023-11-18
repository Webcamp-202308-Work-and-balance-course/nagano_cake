class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 } #支払い方法
    enum address_method: { mine: 0, other: 1 } #お届け先住所
    
    belongs_to :customer
    has_many :order_items
    
    enum status: {
     "入金待ち":0, 
     "入金確認":1, 
     "製作中":2, 
     "発送準備中":3, 
     "発送済み":4
  }
end
