# require 'rails_helper'
#
# RSpec.describe CoursesController, type: :controller do
#   context 'GET #index' do
#     it 'render index' do
#       get :index
#       # expect(response.status).to eq(200) // same as next
#       expect(response).to render_template('index')
#     end
#   end
#
#   context 'GET #show' do
#     let(:course) { FactoryGirl.create(:course) }
#     it 'render show if course found' do
#       get :show, params: { id: course }
#       # expect(response.status).to eq(200) // same as next
#       response.should render_template('show')
#     end
#   end
#
#   context 'GET #new' do
#     it 'render new' do
#       get :new
#       response.should render_template('new')
#     end
#
#     it 'do new Course' do
#       get :new
#       expect(assigns(:course)).to be_a_new(Course)
#     end
#   end
#
#   context 'create action' do
#     # before(:all) do
#     #   @course_valid = FactoryGirl.create(:course)
#     # end
#
#     # it 'should redirect to course if valid' do
#     #   post :create, params: { course: @course_valid.attributes }
#     #   # next line probably do same as above
#     #   # post :create, params: {course: { name: 'test name', description: 'bla bla bla' } }
#     #   expect(response).to redirect_to(course_path(assigns(:course)))
#     # end
#     # it 'creates a new course' do
#     #   expect {
#     #     post :create, params: { course: FactoryGirl.attributes_for(:course) }
#     #     # next line probably do same as above
#     #     # post :create, params: { course: @course_valid.attributes
#     #  # }
#     #   }.to change(Course, :count).by(1)
#     # end
#
#     # it 'redirects to the new course' do
#     #   # post :create, params: { course: @course_valid.attributes }
#     #   # next line probably do same as above
#     #   post :create, params: { course: FactoryGirl.attributes_for(:course) }
#     #   response.should redirect_to Course.last
#     # end
#   end
#
#   # context 'PUT #update' do
#   #   let!(:course) { FactoryGirl.create :course }
#   #
#   #   it 'should update course info' do
#   #     params = {
#   #       name: 'test name',
#   #       description: 'test description'
#   #     }
#   #
#   #     put :update, params: { id: course.id, course: params }
#   #     course.reload
#   #     params.keys.each do |key|
#   #       expect(course.attributes[key.to_s]).to eq params[key]
#   #     end
#   #   end
#   # end
#
#   context 'DELETE #destroy' do
#     let!(:course) { FactoryGirl.create :course }
#
#     it 'should does not delete course if user is unloged' do
#       expect { delete :destroy, params: { id: course.id } }.to change { Course.count }.by(0)
#       # expect(flash[:notice]).to eq 'Product was successfully deleted.'
#     end
#
#     it 'should does not delete course and redirect to root if user is unloged' do
#       delete :destroy, params: { id: course.id }
#       response.should redirect_to(root_path)
#     end
#   end
# end
