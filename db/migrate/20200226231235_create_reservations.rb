class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user_id
      t.references :restaurant_id
      t.datetime :scheduled
      t.integer :number_of_people

      t.timestamps
    end
  end
end
