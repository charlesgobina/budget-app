require 'rails_helper'

describe 'entity index page', type: :feature do
  context 'accessing entity index page' do
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
      visit entities_path
    end

    it 'shows the group index page' do
      expect(page).to have_current_path(entities_path)
    end

    it 'shows transactions title' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'should have dev group' do
      expect(page).to have_content('Dev entity')
    end

    it 'should have button add transaction' do
      expect(page).to have_text('Add Transaction')
    end

    it 'button should redirect to new transaction' do
      click_link 'Add Transaction'
      expect(page).to have_button('Create Transaction')
    end
  end
end
