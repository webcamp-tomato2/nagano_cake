class Address < ApplicationRecord
    belongs_to :customer
    
  def ship_full_address
    "#{postal_code} #{address}"
  end
    
end
