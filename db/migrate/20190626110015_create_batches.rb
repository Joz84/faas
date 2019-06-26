class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :number
      t.string :country
      t.string :city
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
