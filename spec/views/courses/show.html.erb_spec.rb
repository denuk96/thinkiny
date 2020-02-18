require 'spec_helper'

RSpec.describe 'courses/show', type: :view do
  before(:each) do
    assign(:course, Course.create!(name: 'test name', description: 'description'))
    assign(:lessons, [Lesson.create!(theme: 'theme name', description: 'description', time: '16.01.1996', course_id: 1)])
  end
  it 'displays course details correctly' do
    render

    expect(rendered).to match /test name/
    expect(rendered).to match /description/
    # rendered.should contain('test description')
  end
end
