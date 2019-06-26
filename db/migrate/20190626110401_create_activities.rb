class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :target
      t.string :photo
      t.string :link
      t.string :address
      t.string :city
      t.string :country
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
