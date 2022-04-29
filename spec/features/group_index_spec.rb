require 'rails_helper'

describe 'group index page', type: :feature do
  context 'accessing group index page' do
    before :each do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'shows the group index page' do
      expect(page).to have_current_path(authenticated_root_path)
    end

    it 'shows category title' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'should have dev group' do
      expect(page).to have_content('Dev group')
    end

    it 'should have button new category' do
      expect(page).to have_content('New Category')
    end

    it 'should have button new category' do
      click_button 'New Category'
      expect(page).to have_content('New Category')
    end
  end
end
