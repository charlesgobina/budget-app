require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET groups' do
    before(:each) do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      @group = Group.create name: 'Dev group', icon: 'dev.png', author_id: @user
      @entity = Entity.create name: 'Dev entity', amount: 200, author_id: @user, groupe_id: @group

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get groups_path
    end

    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end

  describe 'New group' do
    before(:each) do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      @group = Group.create name: 'Dev group', icon: 'dev.png', author_id: @user
      @entity = Entity.create name: 'Dev entity', amount: 200, author_id: @user, groupe_id: @group

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get new_group_path
    end

    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:new)
    end
  end
end
