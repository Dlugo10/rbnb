class AddStartDateToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :start_date, :date
    add_column :reservations, :end_date, :date
  end
end
