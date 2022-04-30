require 'rails_helper'

describe 'the signin process', type: :feature do
  context 'Wrong or absent sign in credentials' do
    before :each do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      visit user_session_path
    end

    it 'shows invalid email or password when email and password are not provided' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'shows invalid email or password when email or password is wrong' do
      fill_in 'Email', with: 'ab@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end
  end

  context 'Correct sign in credentials' do
    before :each do
      visit user_session_path
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
    end

    it 'redirects user to index page when email and password are correct' do
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_current_path(authenticated_root_path)
    end
  end
end
