require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET /users' do
    it 'returns a success response' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'should contain the placeholder text' do
      get users_path
      expect(response.body).to include('Here the list of users')
    end
  end

  describe 'GET /users/:id' do
    before(:each) do
      @user = User.create(name: 'user1')
    end

    it 'returns a success response' do
      get user_path(@user)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get user_path(@user)
      expect(response).to render_template(:show)
    end

    it 'should contain the placeholder text' do
      get user_path(@user)
      expect(response.body).to include(@user.name)
    end
  end
end
