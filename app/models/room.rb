class Room < ActiveRecord::Base
    belongs_to :user
    
      # les caractéristiques obligatoires d'une annonce (room) pour qu'elle soit valide
  validates :school, presence: true
  validates :address, presence: true
  validates :sexe, presence: true
  validates :room_type, presence: true
  validates :home_type, presence: true
  validates :bail, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :nb_place, numericality: { only_integer: true }
  validates :nb_coloc, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true, greater_than: 5 }
  validates :listing_name, presence: true, length: {maximum: 75}
  
  validates :salle_bain, numericality: { only_integer: true }
  validates :start_date, presence: true
  validates :taille, numericality: { only_integer: true, greater_than: 5 }
  validates :price, numericality: { only_integer: true, greater_than: 5 }
  

  has_many :photos 
  has_many :reservations 
  
   # gem geocoder google map
  geocoded_by :address
  # si l'adresse change, geocode va convertir l'adresse en latitude longitude
  after_validation :geocode, if: :address_changed?

end
