class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person_num, presence: true

  belongs_to :room, optional: true
  belongs_to :user
end
