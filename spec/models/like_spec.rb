require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'update post likes counter' do
    author = User.create(name: 'John Doe')
    post = Post.create(author:, title: 'My Post')

    Like.create(author:, post:)
    expect(post.likes_counter).to eq(1)
  end

  it 'destroy like updates post likes counter' do
    author1 = User.create(name: 'Mary Doe')
    post = Post.create(author: author1, title: 'My Post')
    author = User.create(name: 'John Doe')

    like = Like.create(author:, post:)
    expect(post.likes_counter).to eq(1)

    like.destroy
    expect(post.likes_counter).to eq(0)
  end

  it 'update like updates post likes counter' do
    author1 = User.create(name: 'John Doe')
    post = Post.create(author: author1, title: 'My Post')
    author2 = User.create(name: 'Jane Doe')

    like1 = Like.create(author: author1, post:)
    expect(post.likes_counter).to eq(1)

    like1.update(author: author2)
    expect(post.likes_counter).to eq(1)
  end
end
