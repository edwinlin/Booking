class CreateBookers < ActiveRecord::Migration[5.2]
  def change
    create_table :bookers do |t|

      t.timestamps
    end
  end
end
