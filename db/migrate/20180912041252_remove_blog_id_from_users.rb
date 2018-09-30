class RemoveBlogIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :blog_id, :string
  end
end
