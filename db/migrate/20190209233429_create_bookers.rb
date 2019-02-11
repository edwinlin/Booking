class CreateBookers < ActiveRecord::Migration[5.2]
  def change
    create_table :bookers do |t|

    	t.string :name
    	
      t.timestamps
    end
  end
end
