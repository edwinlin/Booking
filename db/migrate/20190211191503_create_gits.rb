class CreateGits < ActiveRecord::Migration[5.2]
  def change
    create_table :gits do |t|
      t.string :br

      t.timestamps
    end
  end
end
