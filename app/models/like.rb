class Like < ApplicationRecord
  belongs_to :author,
             foreign_key: :author_id,
             class_name: :User

  belongs_to :post,
             foreign_key: :post_id,
             class_name: :Post

  def update_post_likes_counter
    post.likes_counter = post.likes.count
    post.save
  end
end
