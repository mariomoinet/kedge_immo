class AddLanguagesToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :francais,  :boolean
    add_column :rooms, :anglais,  :boolean
    add_column :rooms, :chinois,  :boolean
    add_column :rooms, :allemand,  :boolean
    add_column :rooms, :italien,  :boolean
    add_column :rooms, :espagnol,  :boolean
    add_column :rooms, :arabe,  :boolean
    add_column :rooms, :japonais,  :boolean
    add_column :rooms, :russe,  :boolean
    add_column :rooms, :indien,  :boolean
  end
end
