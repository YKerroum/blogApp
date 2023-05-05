class Post < ApplicationRecord
  belongs_to :author,
             foreign_key: :author_id,
             class_name: :User

  has_many :comments,
           foreign_key: :post_id,
           class_name: :Comment

  has_many :likes,
           foreign_key: :post_id,
           class_name: :Like

  after_create :update_authors_counter
  after_destroy :update_authors_counter
  after_update :update_authors_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
