class AddLatitudeAndLongitudeToAdress < ActiveRecord::Migration[5.1]
  def change
    add_column :adresses, :latitude, :float
    add_column :adresses, :longitude, :float
  end
end
