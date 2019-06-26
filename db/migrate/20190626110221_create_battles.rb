class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.references :batch, foreign_key: true
      t.datetime :date
      t.datetime :deadline

      t.timestamps
    end
  end
end
