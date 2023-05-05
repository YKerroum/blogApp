require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'John Doe')
    @post = Post.create(author: @user, title: 'My Post')
  end

  it 'comment should update post comments counter' do
    Comment.create(author: @user, post: @post)
    expect(@post.comments_counter).to eq(1)
  end

  it 'comment should update post comments counter after destroy' do
    comment = Comment.create(author: @user, post: @post)
    expect(@post.comments_counter).to eq(1)

    comment.destroy
    expect(@post.comments_counter).to eq(0)
  end

  it 'comment should update post comments counter after update' do
    comment = Comment.create(author: @user, post: @post)
    expect(@post.comments_counter).to eq(1)

    comment.update(text: 'New content')
    expect(@post.comments_counter).to eq(1)
  end
end
