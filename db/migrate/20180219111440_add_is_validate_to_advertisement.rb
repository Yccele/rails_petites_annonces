class AddIsValidateToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :is_validate, :boolean, default: false
  end
end
