class Comment < ApplicationRecord
  validates :author_id, :post_id, :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :post 

  belongs_to :parent_comment, optional: true

  



end