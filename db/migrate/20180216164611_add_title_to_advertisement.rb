class AddTitleToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :title, :text
  end
end
