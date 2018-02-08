class Room < ActiveRecord::Base
    belongs_to :user
    validates :listing_name, presence: true, length: {maximum: 75}
    validates :summary, presence: true
    validates :school, presence: true
    validates :start_date, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :price, presence: true
    validates :charges, presence: true
    validates :home_type, presence: true
    validates :start_date, presence: true
    VALID_EMAIL_REGEX = /[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(axis.fr|kedgebs.com)/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }

  has_many :photos
  has_many :reservations

   # gem geocoder google map
  geocoded_by :address
  # si l'adresse change, geocode va convertir l'adresse en latitude longitude
  after_validation :geocode, if: :address_changed?

end
