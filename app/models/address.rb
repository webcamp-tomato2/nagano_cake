class Address < ApplicationRecord
    belongs_to :customer
<<<<<<< HEAD
    validates :name , presence: true
    validates :postal_code , presence: true
    validates :address , presence: true

=======
    
  def ship_full_address
    "#{postal_code} #{address}"
  end
    
>>>>>>> origin/develop
end
