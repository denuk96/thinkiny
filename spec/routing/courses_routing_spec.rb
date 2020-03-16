require 'rails_helper'

RSpec.describe 'routes for Course', type: :routing do
  it 'routes /courses to the courses controller' do
    expect(get('/courses')). to route_to('courses#index')
  end

  it 'routes /courses#show to the courses controller' do
    expect(GET: '/courses/1').to route_to(controller: 'courses', action: 'show', id: '1')
  end

  it 'routes /courses#new to the courses controller' do
    expect(get('/courses/new')). to route_to(controller: 'courses', action: 'new')
  end

  it 'routes /courses#create to the courses controller' do
    expect(post('/courses')). to route_to(controller: 'courses', action: 'create')
  end

  it 'routes /courses#edit to the courses controller' do
    expect(get('/courses/1/edit')). to route_to(controller: 'courses', action: 'edit', id: '1')
  end

  it 'routes /courses#update to the courses controller' do
    expect(patch('/courses/1')). to route_to(controller: 'courses', action: 'update', id: '1')
  end

  it 'routes /courses#destroy to the courses controller' do
    expect(delete('/courses/1')). to route_to(controller: 'courses', action: 'destroy', id: '1')
  end

  it 'routes /courses/change_role to the courses controller' do
    expect(get('/courses/change_role')). to route_to(controller: 'courses', action: 'change_role')
  end
end
