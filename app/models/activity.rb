class Activity < ApplicationRecord
  belongs_to :user
  has_many :choices

  mount_uploader :photo, PhotoUploader
end
