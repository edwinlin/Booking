class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :location

      t.timestamps
    end
  end
end
