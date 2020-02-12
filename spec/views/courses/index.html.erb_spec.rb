require 'spec_helper'

RSpec.describe 'courses/index', type: :view do
  before(:each) do
    assign(:courses,
           [
               Course.create!(name: "test name", description:'description'),
               Course.create!(name: "test name2", description: 'description2')
           ]
    )
  end
  it 'displays course details correctly' do

    render

    expect(rendered).to match /test name/
    expect(rendered).to match /description/
    expect(rendered).to match /test name2/
    expect(rendered).to match /description2/
    # rendered.should contain('test description')
  end
end