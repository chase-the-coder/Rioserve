class ChangeScheduledToDateAndTime < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :time, :time
    add_column :reservations,  :date, :date
    remove_column :reservations, :scheduled
  end
end
