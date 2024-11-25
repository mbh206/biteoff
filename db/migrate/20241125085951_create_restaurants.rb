class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.string :address
      t.decimal :long
      t.decimal :lat

      t.timestamps
    end
  end
end
