require 'rails_helper'

describe 'entity new page', type: :feature do
  context 'accessing entity new page' do
    before :each do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit new_entity_path
    end

    it 'shows the group new page' do
      expect(page).to have_current_path(new_entity_path)
    end

    it 'should have button create transaction' do
      expect(page).to have_button('Create Transaction')
    end
  end
end
