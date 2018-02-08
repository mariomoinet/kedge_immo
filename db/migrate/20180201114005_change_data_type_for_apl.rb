class ChangeDataTypeForApl < ActiveRecord::Migration
  def change
    change_column :rooms, :apl, :boolean
  end
end
