class ChangeGpsAttributeNamesInRestaurants < ActiveRecord::Migration[7.1]
  def change
    rename_column :restaurants, :lat, :latitude
    change_column :restaurants, :latitude, :float
    rename_column :restaurants, :long, :longitude
    change_column :restaurants, :longitude, :float
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
