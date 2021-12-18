class User < ApplicationRecord
  before_save { self.email.downcase! }
 
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :introduce, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  has_secure_password

  mount_uploader :image, ImageUploader

  has_many :rooms
  has_many :reservations

end
