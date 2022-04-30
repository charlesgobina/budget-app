require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'Entity model' do
    before(:each) do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      @group = Group.create name: 'Dev group', icon: 'dev.png', author_id: @user
      @entity = Entity.create name: 'Dev entity', amount: 200, author_id: @user, groupe_id: @group
    end

    it 'validates name' do
      @entity.name = ''
      expect(@entity).to_not be_valid
    end

    it 'validates amount' do
      @entity.amount = ''
      expect(@entity).to_not be_valid
    end

    it 'validates author' do
      @entity.author = nil
      expect(@entity).to_not be_valid
    end

    it 'validates groupe' do
      @entity.groupe = nil
      expect(@entity).to_not be_valid
    end
  end
end
