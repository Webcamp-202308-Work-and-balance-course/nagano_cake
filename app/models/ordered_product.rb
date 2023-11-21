class OrderedProduct < ApplicationRecord
    enum production_status: {
        not_possible_to_manufacture:0,#製作不可
        waiting_for_production:1,#製作待ち
        in_production:2,#製作中
        production_completed:3,#製作完了
    }
    
    belongs_to :item
end
