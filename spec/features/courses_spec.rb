require 'rails_helper'

RSpec.feature 'Courses', type: :feature do
  def login(email, password)
    visit login_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log in'

    expect(page).to have_current_path(courses_path)
    expect(page).to have_content 'Logged in!'
  end

  describe 'Showing courses: ' do
    before(:all) do
      @user = FactoryGirl.create(:user_no_admin)
      @courses = []
      5.times { @courses << FactoryGirl.create(:course) }
    end

    scenario 'Visitor should see the courses list' do
      visit courses_path

      expect(page).to have_text('All courses')
      expect(page).to have_text('test name')
    end

    scenario 'Visitor should show selected course' do
      visit courses_path

      click_link 'test name1'
      expect(page).to have_text('test name1')
      expect(page).to have_current_path(course_path(id: 1))
    end
  end

  describe 'Managing course: ' do
    before(:all) do
      @user = User.create(email: 'email777@mail.com', password: 'password', password_confirmation: 'password')
      @course = FactoryGirl.create(:course)
      CourseUser.create(user_id: @user.id, course_id: @course.id, role: 'organizer')
    end

    scenario 'User should create course' do
      login('email777@mail.com', 'password')
      visit new_course_path

      expect(page).to have_content('New course')
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      # expect(page).to have_content('Address')

      fill_in 'Name', with: 'test name'
      fill_in 'Description', with: 'test description'
      # fill_in 'Address', with: 'default city'
      click_button 'Submit'

      expect(page).to have_current_path(course_path(Course.last))
      expect(page).to have_content('email777@mail.com')
      expect(page).to have_content('Joined')
    end

    scenario 'User should edit his own course' do
      login('email777@mail.com', 'password')

      visit course_path(@course)
      expect(page).to have_content('email777@mail.com')
      expect(page).to have_content('Edit')
      expect(page).to have_content('Destroy')

      click_link 'Edit'
      expect(page).to have_content('Edit course')
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      # expect(page).to have_content('Address')

      click_button 'Submit'
      expect(current_path).to eq course_path(@course)
      expect(page).to have_text 'Course has been edited'
    end

    scenario 'User should to destroy his own course' do
      login('email777@mail.com', 'password')

      visit course_path(@course)
      expect(page).to have_content('email777@mail.com')
      expect(page).to have_content('Edit')
      expect(page).to have_content('Destroy')

      expect { click_link 'Destroy' }.to change(Course, :count).by(-1)
      expect(page).to have_current_path(courses_path)
      expect(page).to have_content('Course has been successfully destroyed')
    end

    scenario 'User can change status from "new" to "in process" ' do
      login('email777@mail.com', 'password')

      visit new_course_path
      fill_in 'Name', with: 'test course'
      fill_in 'Description', with: 'course description'
      click_button 'Submit'
      expect(page).to have_current_path(course_path(Course.last))

      click_link 'Start course'
      expect(page).to have_content('In process')
      expect(page).to have_content('Complete course')
      expect(page).to have_content('Status has changed to In process')
    end

    scenario 'User can complete his course' do
      login('email777@mail.com', 'password')
      visit course_path(Course.last)
      click_link 'Complete course'
      expect(page).to have_content('Completed')
      expect(page).to have_content('Status has changed to Completed')

      visit edit_course_path(Course.last)
      expect(page).to have_content('Course is completed')
    end
  end
end
