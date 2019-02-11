class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :location
      t.boolean :reserved?, default: true

      t.timestamps
    end
  end
end
