class Battle < ApplicationRecord
  belongs_to :batch
  has_many :choices
end
