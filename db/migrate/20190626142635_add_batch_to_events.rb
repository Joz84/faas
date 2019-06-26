class AddBatchToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :batch, foreign_key: true
  end
end
