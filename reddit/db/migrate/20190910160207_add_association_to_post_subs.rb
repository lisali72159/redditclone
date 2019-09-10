class AddAssociationToPostSubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id
    remove_column :subs, :post_id
    add_column :posts, :postsub_id, :integer
    add_column :subs, :postsub_id, :integer
  end
end
