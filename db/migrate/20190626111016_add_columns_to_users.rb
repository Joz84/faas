class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :driver, :boolean
    add_reference :users, :batch, foreign_key: true
  end
end
