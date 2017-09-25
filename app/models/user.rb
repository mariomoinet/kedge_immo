class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :fullname, presence: true, length: {maximum: 65}
  validates :school, presence: true, length: {maximum: 100}
  
   # has_attached_file :avatar signifie qu'on attache un fichier à l'attribut avatar
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ signifie que qu'on accepte tout format photo
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default_image.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
# un user peut avoir plusieurs annonces (rooms)
  has_many :rooms
  has_many :reservations 
end
