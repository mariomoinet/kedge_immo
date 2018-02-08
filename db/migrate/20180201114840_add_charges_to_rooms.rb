class AddChargesToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :charges,  :boolean
  end
end
