# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the histories controller' do
  it 'routes /data_management/histories/ to the histories#index action' do
    expect(get: '/data_management/histories').to route_to('histories#index')
  end

  it 'routes /data_management/histories/1 to the histories#show action' do
    expect(get: '/data_management/histories/1').to route_to(
      controller: 'histories', action: 'show', id: '1'
    )
  end

  it 'routes /data_management/histories/new to the histories#new action' do
    expect(get: '/data_management/histories/new').to route_to(
      controller: 'histories', action: 'new'
    )
  end

  it 'routes POST /data_management/histories to the histories#create action' do
    expect(post: '/data_management/histories').to route_to(
      controller: 'histories', action: 'create'
    )
  end

  it 'routes /data_management/histories/1/edit to the histories#edit action' do
    expect(get: '/data_management/histories/1/edit').to route_to(
      controller: 'histories', action: 'edit', id: '1'
    )
  end

  it 'routes PUT /data_management/histories/1 to the histories#update action' do
    expect(put: '/data_management/histories/1').to route_to(
      controller: 'histories', action: 'update', id: '1'
    )
  end

  it 'routes DELETE /data_management/histories/1 to the histories#destroy action' do
    expect(delete: '/data_management/histories/1').to route_to(
      controller: 'histories', action: 'destroy', id: '1'
    )
  end

  it 'routes /data_management/histories/import to the histories#import action' do
    expect(post: '/data_management/histories/import').to route_to('histories#import')
  end

  it 'routes /data_management/histories/export to the histories#export action' do
    expect(get: '/data_management/histories/export').to route_to('histories#export')
  end
end
