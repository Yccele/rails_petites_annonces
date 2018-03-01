class CreateAdress < ActiveRecord::Migration[5.1]
  def change
    create_table :adresses do |t|
      t.integer :advertisement_id
      t.integer :number
      t.string :rue
      t.string :zip_code
      t.string :ville
      t.string :country
    end
  end
end
