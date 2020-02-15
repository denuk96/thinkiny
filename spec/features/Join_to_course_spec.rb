require 'rails_helper'

RSpec.feature "Courses", type: :feature do
  describe 'User should see courses' do
    before(:all) do
      @courses = []
      10.times { @courses << FactoryGirl.create(:course) }
      FactoryGirl.create(:user_no_admin)

      visit login_path

      fill_in 'email', with: 'email1@com'
      fill_in 'password', with: 'password'

      click_button 'Log in'
      expect(page).to have_current_path(root_path)
      expect(page).to have_content 'Logged in!'
    end



    # scenario 'Visitor should see the courses list' do
    #   visit courses_path
    #
    #   expect(page).to have_text('All courses')
    #   expect(page).to have_text('test name')
    # end

    scenario 'User should log in, find course and join' do
      visit courses_path
      expect(page).to have_content('test name')
      click_link 'test name1'

      expect(page).to have_current_path(course_path(id: 1))

      click_link 'join'
      expect(page).to have_current_path(course_path(id: 1))
      expect(page).to have_content 'joined'
    end
  end
end
