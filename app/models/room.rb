class Room < ApplicationRecord
  validates :name, presence: true
  validates :room_introduce, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :room_image, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person_num, presence: true

  mount_uploader :room_image, ImageUploader

  has_many :reservations, dependent: :destroy

  belongs_to :user

end
