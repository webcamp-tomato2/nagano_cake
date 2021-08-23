class Address < ApplicationRecord
    belongs_to :customer
    
  def ship_full_address
    "#{postal_code} #{address}"
  end
    
    # validates :name , presence: true
    # validates :postal_code , presence: true
    # validates :address , presence: true

end
