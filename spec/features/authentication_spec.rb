require 'rails_helper'

RSpec.feature 'authentication', type: :feature do
  scenario 'Sign up' do
    visit signup_path

    expect(page).to have_content 'First name'
    expect(page).to have_content 'Last name'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password confirmation'

    fill_in 'First name', with: 'James'
    fill_in 'Last name', with: 'Bond'
    fill_in 'Email', with: 'email96@com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    expect { click_button 'Sign up' }.to change(User, :count).by(1)
    expect(page).to have_current_path(courses_path)
    expect(page).to have_content 'Welcome aboard'
  end

  scenario 'User should log in' do
    FactoryGirl.create(:user_no_admin)
    visit login_path

    fill_in 'email', with: 'email1@com'
    fill_in 'password', with: 'password'

    click_button 'Log in'
    expect(page).to have_current_path(courses_path)
    expect(page).to have_content 'Logged in!'
  end
end
