class Batch < ApplicationRecord
  has_many :events
  has_many :battles
  has_many :users
  belongs_to :driver, class_name: "User", foreign_key: 'user_id', optional: true
end
