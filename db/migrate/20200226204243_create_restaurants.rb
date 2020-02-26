class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :capacity
      t.string :category
      t.integer :rating
      t.string :address
      t.string :price_range

      t.timestamps
    end
  end
end
