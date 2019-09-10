class DeletePostsubColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :postsub_id
    remove_column :posts, :postsub_id
  end
end
