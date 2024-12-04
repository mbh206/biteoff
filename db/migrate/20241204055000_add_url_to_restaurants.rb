class AddUrlToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :url, :string
  end
end
