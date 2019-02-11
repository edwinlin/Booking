class CreateListers < ActiveRecord::Migration[5.2]
  def change
    create_table :listers do |t|
    	t.string :name
    	
      t.timestamps
    end
  end
end
