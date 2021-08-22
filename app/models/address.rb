class Address < ApplicationRecord
  before_action :authenticate_customer!
    belongs_to :customer
    validates :name , presence: true
    validates :postal_code , presence: true
    validates :address , presence: true

end
