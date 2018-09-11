class RemoveImageFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :image, :json
  end
end
