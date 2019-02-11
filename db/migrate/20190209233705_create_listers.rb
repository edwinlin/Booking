class CreateListers < ActiveRecord::Migration[5.2]
  def change
    create_table :listers do |t|

      t.timestamps
    end
  end
end
