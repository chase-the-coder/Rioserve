class AddInfoToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :image, :string
    add_column :restaurants, :cost_for_two, :integer
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :menu, :string
  end
end
