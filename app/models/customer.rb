class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
<<<<<<< HEAD
  has_many :orders,dependent: :destroy
  has_many :orders,dependent: :destroy
  
=======
  has_many :order_details, dependent: :destroy
  has_many :order, dependent: :destroy


>>>>>>> origin/develop
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def full_name
    "#{last_name}#{first_name}"
  end
  
  def customer_full_address
    "#{postal_code} #{address}"
  end

end
