# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the uses controller' do
  it 'routes /data_management/uses/ to the uses#index action' do
    expect(get: '/data_management/uses').to route_to('uses#index')
  end

  it 'routes /data_management/uses/1 to the uses#show action' do
    expect(get: '/data_management/uses/1').to route_to(
      controller: 'uses', action: 'show', id: '1'
    )
  end

  it 'routes /data_management/uses/new to the uses#new action' do
    expect(get: '/data_management/uses/new').to route_to(
      controller: 'uses', action: 'new'
    )
  end

  it 'routes POST /data_management/uses to the uses#create action' do
    expect(post: '/data_management/uses').to route_to(
      controller: 'uses', action: 'create'
    )
  end

  it 'routes /data_management/uses/1/edit to the uses#edit action' do
    expect(get: '/data_management/uses/1/edit').to route_to(
      controller: 'uses', action: 'edit', id: '1'
    )
  end

  it 'routes PUT /data_management/uses/1 to the uses#update action' do
    expect(put: '/data_management/uses/1').to route_to(
      controller: 'uses', action: 'update', id: '1'
    )
  end

  it 'routes DELETE /data_management/uses/1 to the uses#destroy action' do
    expect(delete: '/data_management/uses/1').to route_to(
      controller: 'uses', action: 'destroy', id: '1'
    )
  end

  it 'routes /data_management/uses/import to the uses#import action' do
    expect(post: '/data_management/uses/import').to route_to('uses#import')
  end

  it 'routes /data_management/uses/export to the uses#expect action' do
    expect(get: '/data_management/uses/export').to route_to('uses#export')
  end
end
