class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :user_id_id, :user_id
    rename_column :reservations, :restaurant_id_id, :restaurant_id
  end
end
