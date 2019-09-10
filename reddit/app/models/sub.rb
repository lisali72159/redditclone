class Sub < ApplicationRecord

  validates :title, :description, :user_id, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :post_subs

  has_many :posts, through: :post_subs, source: :post

end