class AddPersonaliterToRooms < ActiveRecord::Migration
  def change
        add_column :rooms, :personnaliterdescription, :text
  end
end
