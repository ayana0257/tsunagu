class AddImageIdToBlogImages < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_images, :image_id, :string
  end
end
