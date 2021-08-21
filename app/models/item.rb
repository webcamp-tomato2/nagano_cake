class Item < ApplicationRecord
  belongs_to :genre
  attachment :image

  has_many :cart_items,dependent: :destroy

  # いらないかも
  def add_tax_price
    (self.price * 1.10).round
  end
end
