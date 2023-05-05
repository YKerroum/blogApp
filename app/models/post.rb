class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250, too_long: '250 characters is the maximum allowed' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author,
             foreign_key: :author_id,
             class_name: :User

  has_many :comments,
           foreign_key: :post_id,
           class_name: :Comment

  has_many :likes,
           foreign_key: :post_id,
           class_name: :Like

  after_create :update_author_posts_counter
  after_destroy :update_author_posts_counter
  after_update :update_author_posts_counter

  def update_author_posts_counter
    author.posts_counter = author.posts.count
    author.save
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
