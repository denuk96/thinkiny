require 'spec_helper'

RSpec.describe 'courses/_form', type: :view do
  before(:each) do
    assign(:course,
           Course.create!(name: 'test name', description: 'description'))
  end
  it 'displays form correctly' do
    render

    expect(rendered).to match /name/
    expect(rendered).to match /description/
    expect(rendered).to match /submit/
  end
end
