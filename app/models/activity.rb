class Activity < ApplicationRecord
  belongs_to :user, optional: true

  enum status: { confirmed: 0, cancelled: 1 }
  has_many :choices
  enum target: {team_building: 0, ice_breaker: 1}
  enum status: {approved: 0, pending: 1}
  mount_uploader :photo, PhotoUploader

end
