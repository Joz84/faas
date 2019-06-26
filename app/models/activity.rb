class Activity < ApplicationRecord
  belongs_to :user
  has_many :choices
  enum target: {team_building: 0, ice_breaker: 1}
  enum status: {approved: 0, pending: 1}
end
