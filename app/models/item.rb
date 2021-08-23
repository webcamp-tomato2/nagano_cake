class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items,dependent: :destroy

  attachment :image

  # いらないかも
  def add_tax_price
    (self.price * 1.10).round
  end

  # selfはクラスメソッド
  # クラスメソッドはmodelクラスのレコードを検索するなどの用途や
  # 作成されたインスタンスの数を数えるなどのためのメソッド
  def self.search_for(content)
    #.orを使用することで、contentに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Item.where('name LIKE ?', '%'+content+'%').or(Item.where(genre_id: content))
  end

end
