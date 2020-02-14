require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  before(:all) do
    FactoryGirl.create(:user_no_admin)
  end

  it 'User should log in' do
    visit '/login'

    fill_in 'email', with: 'email1@com'
    fill_in 'password', with: 'password'

    click_button 'Log in'
    current_path.should == root_path
    expect(page).to have_content 'Logged in!'
  end
end
