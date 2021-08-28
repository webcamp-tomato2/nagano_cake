class OrderDetail < ApplicationRecord
  
  enum making_status: { 製作不可: 0, 製作待ち: 1, 制作中: 2, 製作完了: 3 }
  belongs_to :order
  belongs_to :item

   validates :price, presence: true
   validates :amount, presence: true


end
