class AddAttachmentImageToPhotos < ActiveRecord::Migration
  def change
    add_attachment :photos, :image
  end
end
