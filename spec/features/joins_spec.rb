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

  scenario 'User should find moderated course and leave request to join' do
    course = Course.create(name: 'moderated course', description: 'description', pre_moderation: true)
    login

    visit courses_path
    expect(page).to have_content('moderated course')
    click_link 'moderated course'

    expect(page).to have_current_path(course_path(course))

    click_link 'Join'
    expect(page).to have_current_path(course_path(course))
    expect(page).to have_content 'Request leaved'
  end

  scenario 'User should find course without free places' do
    course = Course.create(name: 'filled course', description: 'description', place_quantities: 1)
    user = FactoryGirl.create(:user_no_admin)
    CourseUser.create(user_id: user.id, course_id: course.id, role: 'participant', confirmed: true)
    login

    visit courses_path
    expect(page).to have_content('filled course')
    click_link 'filled course'

    expect(page).to have_current_path(course_path(course))
    expect(page).to have_content 'has no free places'
  end
end
