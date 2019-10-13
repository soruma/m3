# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the events controller', type: :routing do
  it 'routes /data_management/events/ to the events#index action' do
    expect(get: '/data_management/events').to route_to('events#index')
  end

  it 'routes /data_management/events/1 to the events#show action' do
    expect(get: '/data_management/events/1').to route_to(
      controller: 'events', action: 'show', id: '1'
    )
  end

  it 'routes /data_management/events/new to the events#new action' do
    expect(get: '/data_management/events/new').to route_to(
      controller: 'events', action: 'new'
    )
  end

  it 'routes POST /data_management/events to the events#create action' do
    expect(post: '/data_management/events').to route_to(
      controller: 'events', action: 'create'
    )
  end

  it 'routes /data_management/events/1/edit to the events#edit action' do
    expect(get: '/data_management/events/1/edit').to route_to(
      controller: 'events', action: 'edit', id: '1'
    )
  end

  it 'routes PUT /data_management/events/1 to the events#update action' do
    expect(put: '/data_management/events/1').to route_to(
      controller: 'events', action: 'update', id: '1'
    )
  end

  it 'routes DELETE /data_management/events/1 to the events#destroy action' do
    expect(delete: '/data_management/events/1').to route_to(
      controller: 'events', action: 'destroy', id: '1'
    )
  end
end
