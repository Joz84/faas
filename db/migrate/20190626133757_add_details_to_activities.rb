class AddDetailsToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :content, :text
  end
end
