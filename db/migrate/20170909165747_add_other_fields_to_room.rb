class AddOtherFieldsToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :summary, :text
    add_column :rooms, :listing_name, :string
    add_column :rooms, :active, :boolean
  end
end
