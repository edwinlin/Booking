class AddImgUrlToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :img_url, :string
  end
end
