require 'spec_helper'

RSpec.describe 'courses/new', type: :view do
  before(:each) do
    assign(:course,
           Course.create!(name: 'test name', description: 'description'))
  end
  it 'displays course/new with partial correctly' do
    course = FactoryGirl.create(:course)
    render partial: 'form', locals: { course: course }

    expect(rendered).to match /name/
    expect(rendered).to match /description/
    expect(rendered).to match /submit/
  end
end
