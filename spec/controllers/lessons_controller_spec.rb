# require 'rails_helper'
#
# RSpec.describe LessonsController, type: :controller do
#   before(:each) do
#     @course = FactoryGirl.create(:course)
#     @lesson = FactoryGirl.create(:lesson)
#   end
#
#   context 'GET #index' do
#     it 'render index' do
#       get :index, params: { id: @lesson.id, course_id: @course.id }
#       expect(response).to render_template('index')
#     end
#   end
#
#   context 'GET #show' do
#     it 'render show if lesson found' do
#       get :show, params: { id: @lesson.id, course_id: @course.id }
#       expect(response).to render_template('show')
#     end
#   end
#
#   context 'GET #new' do
#     it 'redirect to root if user has no right' do
#       get :new, params: { course_id: @course.id }
#       response.should redirect_to(root_path)
#     end
#
#     # it 'render new if has rights' do
#     #   get :new, params: { course_id: @course.id }
#     #   response.should render_template('new')
#     # end
#
#     # it 'do new Course' do
#     #   get :new, params: { course_id: @course.id }
#     #   expect(assigns(:lesson)).to be_a_new(Lesson)
#     # end
#   end
#
#   context 'Create action' do
#     it 'should redirect to root if user has no right or unlogged' do
#       expect do
#         post :create, params: { id: @lesson.id, course_id: @course.id }
#       end.to change(Course, :count).by(0)
#       expect(response).to redirect_to(root_path)
#     end
#
#     # it 'should creat lesson if user has rights' do
#     #   expect {
#     #     post :create, params: { id: @lesson.id, course_id: @course.id }
#     #   }.to change(Course, :count).by(1)
#     #   expect(response).to redirect_to(assigns(:course))
#     # end
#   end
#
#   context 'Destroy action' do
#     it 'should redirect to root if user has no right or unlogged ' do
#       expect { delete :destroy, params: { id: @lesson.id, course_id: @course.id } }.to change { Course.count }.by(0)
#       expect(response).to redirect_to(root_path)
#     end
#
#     # it 'should destroy and redirect to course if user has rights ' do
#     #   expect { delete :destroy, params: { id: @lesson.id, course_id: @course.id } }.to change { Course.count }.by(-1)
#     #   expect(response).to redirect_to(assigns(:course))
#     # end
#   end
# end
