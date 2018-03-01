class AddPaperclipToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_attachment :advertisements, :image
  end
end
