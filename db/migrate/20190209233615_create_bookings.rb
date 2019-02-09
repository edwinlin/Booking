class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :booker_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
