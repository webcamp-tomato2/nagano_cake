class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def add_tax_price
    (self.item.price*1.10).round
  end

  def sub_price
    add_tax_price*self.amount
  end

  def total_price
    # わからん
    @sum = 0
    self.to_a.each do |item|
      @sum += item.sub_price
    end
    return @sum
  end

end
