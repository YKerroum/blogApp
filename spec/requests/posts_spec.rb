require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:each) do
      @user = User.create(name: 'user1')
      @post = @user.posts.create(title: 'post1')
    end

    it 'returns a success response' do
      get user_posts_path(@user)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get user_posts_path(@user)
      expect(response).to render_template(:index)
    end

    it 'should contain the placeholder text' do
      get user_posts_path(@user)
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before(:each) do
      @user = User.create(name: 'user1')
      @post = @user.posts.create(title: 'post1')
    end

    it 'returns a success response' do
      get user_post_path(@user, @post)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get user_post_path(@user, @post)
      expect(response).to render_template(:show)
    end

    it 'should contain the placeholder text' do
      get user_post_path(@user, @post)
      expect(response.body).to include(@user.name)
      expect(response.body).to include(@post.id.to_s)
    end
  end
end
