require 'rails_helper'

describe 'entity show page', type: :feature do
  context 'accessing entity show page' do
    before :each do
      User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      @group = Group.create(name: 'Dev group', icon: 'dev.png', author: User.first)
      @entity = Entity.create(name: 'Dev entity', amount: 200, author: User.first, groupe: @group)
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit entity_url(@entity.id)
    end

    it 'shows the group show page' do
      expect(page).to have_current_path(entity_url(@entity.id))
    end

    it 'should have title single transaction' do
      expect(page).to have_content('SINGLE TRANSACTION')
    end

    it 'should have transaction name Dev entity' do
      expect(page).to have_content('Dev entity')
    end

    it 'should have amount 200' do
      expect(page).to have_content('$200')
    end
  end
end
