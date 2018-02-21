class TableComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments
    add_column :comments, :content, :text
    add_column :comments, :advertisement_id, :integer
  end
end
