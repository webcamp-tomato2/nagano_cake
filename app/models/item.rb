class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  
  attachment :image

  # いらないかも
  def add_tax_price
    (self.price * 1.10).round
  end
end
