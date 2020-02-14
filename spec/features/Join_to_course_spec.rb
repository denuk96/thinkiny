require 'rails_helper'

RSpec.feature "Courses", type: :feature do
  describe 'User should see courses' do
    before(:all) do
      @courses = []
      3.times { @courses << FactoryGirl.create(:course) }
      FactoryGirl.create(:user_no_admin)
    end



    # scenario 'Visitor should see the courses list' do
    #   visit courses_path
    #
    #   expect(page).to have_text('All courses')
    #   expect(page).to have_text('test name')
    # end

    scenario 'User should log in, find course and join' do
      visit login_path

      fill_in 'email', with: 'email1@com'
      fill_in 'password', with: 'password'

      click_button 'Log in'
      current_path.should == root_path
      expect(page).to have_content 'Logged in!'

      visit courses_path
      expect(page).to have_content('test name')
      click_link 'test name3'


      current_path.should == course_path(id: 3)

      click_link 'join'
      current_path.should == course_path(id: 3)
      expect(page).to have_content 'joined'
    end
  end
end
