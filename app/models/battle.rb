class Battle < ApplicationRecord
  belongs_to :batch

  has_many :choices

  def title
    "#{choices.first&.activity&.name} vs #{choices.second&.activity&.name}"
  end
end
