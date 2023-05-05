require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'name should be present' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'posts counter should be a number' do
      user = User.new(posts_counter: 'string')
      expect(user).to_not be_valid
    end

    it 'posts counter should be greater than or equal to 0' do
      user = User.new(posts_counter: -1)
      expect(user).to_not be_valid
    end
  end

  context 'associations and methods' do
    it 'three recent posts should return the most recent three posts' do
      user = User.create(name: 'User 1')
      Post.create(author: user, title: 'Post 1', text: 'Content 1')
      post2 = Post.create(author: user, title: 'Post 2', text: 'Content 2')
      post3 = Post.create(author: user, title: 'Post 3', text: 'Content 3')
      post4 = Post.create(author: user, title: 'Post 4', text: 'Content 4')

      expect(user.three_recent_posts).to eq [post4, post3, post2]
    end
  end
end
