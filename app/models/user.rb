class User < ApplicationRecord
  # The user has many posts
  has_many :posts,
           foreign_key: :author_id,
           class_name: :Post

  # The user has many comments
  has_many :comments,
           foreign_key: :author_id,
           class_name: :Comment

  # The user has many likes
  has_many :likes,
           foreign_key: :author_id,
           class_name: :Like

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
