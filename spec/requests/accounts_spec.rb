# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Accounts' do
  describe 'GET accounts/index' do
    before do
      create(:wallet)
      create(:cash_stash)

      get accounts_url
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include name' do
      expect(response.body).to include 'Wallet'
      expect(response.body).to include 'Cash stash'
    end
  end

  describe 'GET accounts/show' do
    before do
      get account_url id: create(:wallet)
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include name' do
      expect(response.body).to include 'Wallet'
    end
  end

  describe 'GET accounts/new' do
    before do
      get new_account_url
    end

    it do
      expect(response).to have_http_status :success
    end
  end

  describe 'GET accounts/edit' do
    before do
      get edit_account_url id: wallet
    end

    let(:use) { create(:use) }
    let(:wallet) { create(:wallet, use: use) }

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include name' do
      expect(response.body).to include 'Wallet'
    end

    it 'response.body include use' do
      expect(response.body).to include %(<option selected="selected" value="#{use.id}">#{use.name}</option>)
    end
  end

  describe 'POST accounts/create' do
    context 'when valid params' do
      let(:use) { create(:use) }

      it do
        post accounts_url params: { account: build(:account, use: use).attributes }
        expect(response).to have_http_status :found
      end

      it 'account can registration' do
        expect do
          post accounts_url params: { account: build(:account, use: use).attributes }
        end.to change(Account, :count).by(1)
      end

      it 'redirect' do
        post accounts_url params: { account: build(:account, use: use).attributes }
        expect(response).to redirect_to Account.last
      end
    end

    context 'when invalid params' do
      it do
        post accounts_url params: { account: build(:account, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'evnet can not registration' do
        expect do
          post accounts_url params: { account: build(:account, :invalid).attributes }
        end.to_not change(Account, :count)
      end

      it 'display an errors' do
        post accounts_url params: { account: build(:account, :invalid).attributes }
        expect(response.body).to include 'prohibited this account from being saved'
      end
    end
  end

  describe 'PUT accounts/update' do
    let(:wallet) { create(:wallet) }
    let(:saving) { create(:saving) }

    context 'when valid params' do
      it do
        put account_url id: wallet, params: { account: build(:cash_stash, use: saving).attributes }
        expect(response).to have_http_status :found
      end

      it 'name is updated' do
        expect do
          put account_url id: wallet, params: { account: build(:cash_stash, use: saving).attributes }
        end.to change {
          Account.find(wallet.id).name
        }.from('Wallet').to('Cash stash')
      end

      it 'use is updated' do
        expect do
          put account_url id: wallet, params: { account: build(:cash_stash, use: saving).attributes }
        end.to change {
          Account.find(wallet.id).use.name
        }.from('Usually use').to('Saving')
      end

      it 'redirect' do
        put account_url id: wallet, params: { account: build(:account, use: saving).attributes }
        expect(response).to redirect_to Account.last
      end
    end

    context 'when invalid params' do
      it do
        put account_url id: wallet, params: { account: build(:account, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'name is not updated' do
        expect do
          put account_url id: wallet, params: { account: build(:account, :invalid).attributes }
        end.to_not change(Account.find(wallet.id), :name)
      end

      it 'use is not updated' do
        expect do
          put account_url id: wallet, params: { account: build(:account, :invalid).attributes }
        end.to_not change(Account.find(wallet.id), :use)
      end

      it 'display an errors' do
        put account_url id: wallet, params: { account: build(:account, :invalid).attributes }
        expect(response.body).to include 'prohibited this account from being saved'
      end
    end

    context 'DELETE accounts/destroy' do
      context 'when delete is successful' do
        let!(:account) { create(:account) }

        it do
          delete account_url id: account
          expect(response).to have_http_status :found
        end

        it 'is delete account' do
          expect do
            delete account_url id: account
          end.to change(Account, :count).by(-1)
        end

        it 'redirect' do
          delete account_url id: account
          expect(response).to redirect_to(accounts_url)
        end
      end

      context 'when delete is faild' do
        let!(:account) { create(:account) }

        before { create(:history, account: account) }

        it do
          delete account_url id: account
          expect(response).to have_http_status :found
        end

        it 'is not delete account' do
          expect do
            delete account_url id: account
          end.not_to change(Account, :count)
        end

        it 'redirect' do
          delete account_url id: account
          expect(response).to redirect_to(accounts_url)
        end
      end
    end
  end

  describe 'json' do
    let(:headers) do
      { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    end

    describe 'GET accounts.json' do
      before do
        create_list(:account, 2)
        get accounts_url, headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get list of accounts' do
        expect(response.body).to have_json_size 2
      end
    end

    describe 'GET accounts/1.json' do
      before do
        get account_url(id: create(:account)), headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get account' do
        expect(response.body).to have_json_path 'id'
        expect(response.body).to have_json_path 'use_id'
        expect(response.body).to have_json_path 'name'
        expect(response.body).to have_json_path 'use/id'
        expect(response.body).to have_json_path 'use/name'
      end
    end
  end
end
