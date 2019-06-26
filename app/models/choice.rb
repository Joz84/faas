class Choice < ApplicationRecord
  belongs_to :battle, inverse_of: :choices
  belongs_to :activity
end
