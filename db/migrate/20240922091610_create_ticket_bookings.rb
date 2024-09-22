class CreateTicketBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :tickets

      t.timestamps
    end
  end
end
