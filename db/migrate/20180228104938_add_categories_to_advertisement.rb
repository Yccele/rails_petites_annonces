class AddCategoriesToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :category_id, :integer
  end
end
