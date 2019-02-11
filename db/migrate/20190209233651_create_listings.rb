class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    	t.string :name
		t.integer :lister_id
		    	
      t.timestamps
    end
  end
end
