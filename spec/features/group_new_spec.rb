require 'rails_helper'

describe 'group new page', type: :feature do
  context 'accessing group new page' do
    before :each do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit new_group_path
    end

    it 'shows the group new page' do
      expect(page).to have_current_path(new_group_path)
    end

    it 'should have title new category' do
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
