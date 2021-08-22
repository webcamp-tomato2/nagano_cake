class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  
  attachment :image
  attachment :image
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  # いらないかも
  def add_tax_price
    (self.price * 1.10).round
  end
  
end
