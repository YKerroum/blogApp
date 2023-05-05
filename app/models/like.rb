class Like < ApplicationRecord
  belongs_to :author,
             foreign_key: :author_id,
             class_name: :User

  belongs_to :post,
             foreign_key: :post_id,
             class_name: :Post

  after_create :update_post_likes_counter
  after_destroy :update_post_likes_counter
  after_update :update_post_likes_counter

  def update_post_likes_counter
    post.likes_counter = post.likes.count
    post.save
  end
end
