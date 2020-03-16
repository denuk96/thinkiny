require 'rails_helper'

RSpec.feature 'Lessons', type: :feature do
  def login(email, password)
    visit login_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log in'

    expect(page).to have_current_path(courses_path)
    expect(page).to have_content 'Logged in!'
  end
  describe 'Showing lesson: ' do
    before(:all) do
      @user = FactoryGirl.create(:user_no_admin)
      @course = FactoryGirl.create(:course)
      @lesson = FactoryGirl.create(:lesson)
    end

    scenario 'Visitor should see lesson in courses' do
      visit course_path(@course)
      expect(page).to have_text('all lessons')
    end
  end

  describe 'Showing lesson if user on organizer ' do
    before(:all) do
      @user = User.create(email: 'email777@mail.com', password: 'password', password_confirmation: 'password')
      @course = FactoryGirl.create(:course)
      CourseUser.create(user_id: @user.id, course_id: @course.id, role: 'participant', confirmed: true)
      @lesson = FactoryGirl.create(:lesson)
    end
    scenario 'Visitor should see in lesson' do
      login('email777@mail.com', 'password')
      visit course_lesson_path(id: @lesson, course_id: @course)
      expect(page).to have_no_text('Edit', 'Destroy')
    end
  end

  describe 'Showing lesson if user - organizer ' do
    before(:all) do
      @user = User.create(email: 'email722@mail.com', password: 'password', password_confirmation: 'password')
      @course = FactoryGirl.create(:course)
      @course_user = CourseUser.create(user_id: @user.id, course_id: @course.id, role: 'organizer', confirmed: true)
      @lesson = Lesson.create(theme: 'test theme',
                              description: 'test description',
                              time: '2020-02-06 23:17:23',
                              course_id: @course.id)
    end

    scenario 'Visitor should see in lesson' do
      login('email722@mail.com', 'password')
      visit course_lesson_path(@course, @lesson)
      expect(page).to have_text('check_ins')
    end
  end
end
