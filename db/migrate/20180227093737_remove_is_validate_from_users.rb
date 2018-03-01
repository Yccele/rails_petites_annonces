class RemoveIsValidateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :is_validate, :boolean
  end
end
