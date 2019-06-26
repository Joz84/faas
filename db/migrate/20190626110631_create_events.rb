class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.string :photo
      t.string :link
      t.string :address
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
