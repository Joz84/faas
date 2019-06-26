class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :battle, foreign_key: true
      t.references :activity, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
