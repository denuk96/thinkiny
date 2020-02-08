require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  context 'GET #index' do
    it 'render index' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'GET #show' do
    let(:course) { FactoryGirl.create(:course) }
    it 'render show if course found' do
      course = FactoryGirl.create(:course)
      get :show, params: { id: course }
      expect(response.status).to eq(200)
    end
  end
end