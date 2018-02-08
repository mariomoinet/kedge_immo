class AddCautionToRooms < ActiveRecord::Migration
  def change
        add_column :rooms, :caution,  :integer
  end
end
