class AddPriceToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :price, :integer
  end
end
