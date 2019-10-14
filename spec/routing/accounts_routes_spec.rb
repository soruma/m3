# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the accounts controller' do
  it 'routes /data_management/accounts/ to the accounts#index action' do
    expect(get: '/data_management/accounts').to route_to('accounts#index')
  end

  it 'routes /data_management/accounts/1 to the accounts#show action' do
    expect(get: '/data_management/accounts/1').to route_to(
      controller: 'accounts', action: 'show', id: '1'
    )
  end

  it 'routes /data_management/accounts/new to the accounts#new action' do
    expect(get: '/data_management/accounts/new').to route_to(
      controller: 'accounts', action: 'new'
    )
  end

  it 'routes POST /data_management/accounts to the accounts#create action' do
    expect(post: '/data_management/accounts').to route_to(
      controller: 'accounts', action: 'create'
    )
  end

  it 'routes /data_management/accounts/1/edit to the accounts#edit action' do
    expect(get: '/data_management/accounts/1/edit').to route_to(
      controller: 'accounts', action: 'edit', id: '1'
    )
  end

  it 'routes PUT /data_management/accounts/1 to the accounts#update action' do
    expect(put: '/data_management/accounts/1').to route_to(
      controller: 'accounts', action: 'update', id: '1'
    )
  end

  it 'routes DELETE /data_management/accounts/1 to the accounts#destroy action' do
    expect(delete: '/data_management/accounts/1').to route_to(
      controller: 'accounts', action: 'destroy', id: '1'
    )
  end

  it 'routes /data_management/accounts/import to the accounts#import action' do
    expect(post: '/data_management/accounts/import').to route_to('accounts#import')
  end

  it 'routes /data_management/accounts/export to the accounts#export action' do
    expect(get: '/data_management/accounts/export').to route_to('accounts#export')
  end
end
