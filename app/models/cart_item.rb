class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  # インスタンスメソッド(それぞれのインスタンスに対して参照などをするメソッド)
  def add_tax_price
    # インスタンスメソッドのitem.priceがよばれ
    # itemのpriceカラムに1.1をかける
    (self.item.price*1.10).round
  end

  def sub_price
    add_tax_price*self.amount
  end
  # 合計金額についてはcart_itemコントローラに記述しています
end
