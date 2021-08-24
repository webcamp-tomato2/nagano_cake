class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  has_many :order_details

  attachment :image
  # validates :name, presence: true
  # validates :image, presence: true
  # validates :introduction, presence: true
  # validates :price, presence: true

  # いらないかも
  def add_tax_price
    (self.price * 1.10).round
  end
  # selfはクラスメソッド
  # クラスメソッドはmodelクラスのレコードを検索するなどの用途や
  # 作成されたインスタンスの数を数えるなどのためのメソッド。
  # content(仮引数)に一致するデータを検索する関数search_
  def self.search_for(content)
    #.orを使用することで、contentに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Item.where('name LIKE ?', '%'+content+'%').or(Item.where(genre_id: content))
  end
end
