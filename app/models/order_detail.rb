class OrderDetail < ApplicationRecord
  enum making_status: { 製作不可: 0, 製作待ち: 1, 制作中:2, 製作完了:3 }
<<<<<<< HEAD
  belongs_to :order
    validates :price, presence: true
    validates :amount, presence: true

=======
  
  belongs_to :order
  belongs_to :item
  
>>>>>>> origin/develop
end
