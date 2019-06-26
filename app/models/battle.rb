class Battle < ApplicationRecord
  belongs_to :batch

  has_many :choices, inverse_of: :battle
  accepts_nested_attributes_for :choices,
                                reject_if: proc { |attributes| attributes[:activity_id].blank? },
                                allow_destroy: true




  def title
    "#{choices.first&.activity&.name} vs #{choices.second&.activity&.name}"
  end
end
