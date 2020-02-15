require 'rails_helper'

RSpec.feature 'Joins', type: :feature do
  def login
    visit login_path
    fill_in 'email', with: 'email1@com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
  end

  before(:all) do
    FactoryGirl.create(:user_no_admin)
    @course = FactoryGirl.create(:course)
  end

  scenario 'User should find course and join' do
    login

    visit courses_path
    expect(page).to have_content('test name')
    visit course_path(@course)

    expect(page).to have_current_path(course_path(@course))

    click_link 'Join'
    expect(page).to have_current_path(course_path(@course))
    expect(page).to have_content 'joined'
  end
end
