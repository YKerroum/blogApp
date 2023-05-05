class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
