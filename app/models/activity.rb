class Activity < ApplicationRecord
  belongs_to :user, optional: true

  enum status: { confirmed: 0, cancelled: 1 }
  has_many :choices

  mount_uploader :photo, PhotoUploader

end
