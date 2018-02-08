class AddCaracteristiquepersonaliterToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :age, :string
    add_column :rooms, :langue, :string
  end
end
