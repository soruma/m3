# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Histories' do
  describe 'GET histories/index' do
    before do
      create(:his_2017_01)
      create(:his_2017_02)

      get histories_url
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include date_of_onset' do
      expect(response.body).to include '2017/01'
      expect(response.body).to include '2017/02'
    end

    it 'response.body include account name' do
      expect(response.body).to include 'Wallet'
      expect(response.body).to include 'Cash stash'
    end

    it 'response.body include price' do
      expect(response.body).to include '999'
      expect(response.body).to include '100'
    end
  end

  describe 'GET histories/show' do
    before do
      get history_url id: create(:his_2017_01)
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include date_of_onset' do
      expect(response.body).to include '2017/01'
    end

    it 'response.body include account name' do
      expect(response.body).to include 'Wallet'
    end
  end

  describe 'GET histories/new' do
    before do
      get new_history_url
    end

    it do
      expect(response).to have_http_status :success
    end
  end

  describe 'GET histories/edit' do
    before do
      get edit_history_url id: create(:his_2017_01, account: wallet)
    end

    let(:wallet) { create(:wallet) }

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include date_of_onset' do
      expect(response.body).to include '<option value="2017" selected="selected">2017</option>'
      expect(response.body).to include '<option value="1" selected="selected">1</option>'
    end

    it 'response.body include name account name' do
      expect(response.body).to include %(<option selected="selected" value="#{wallet.id}">#{wallet.name}</option>)
    end

    it 'response.body include name price' do
      expect(response.body).to include '999'
    end
  end

  describe 'POST histories/create' do
    context 'when valid params' do
      let(:account) { create(:account) }

      it do
        post histories_url params: { history: build(:history, account: account).attributes }
        expect(response).to have_http_status :found
      end

      it 'evnet can registration' do
        expect do
          post histories_url params: { history: build(:history, account: account).attributes }
        end.to change(History, :count).by(1)
      end

      it 'redirect' do
        post histories_url params: { history: build(:history, account: account).attributes }
        expect(response).to redirect_to History.last
      end
    end

    context 'when invalid params' do
      it do
        post histories_url params: { history: build(:history, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'evnet can not registration' do
        expect do
          post histories_url params: { history: build(:history, :invalid).attributes }
        end.to_not change(History, :count)
      end

      it 'display an errors' do
        post histories_url params: { history: build(:history, :invalid).attributes }
        expect(response.body).to include 'prohibited this history from being saved'
      end
    end
  end

  describe 'PUT histories/update' do
    let(:his_2017_01) { create(:his_2017_01) }
    let(:cash_stash) { create(:cash_stash) }

    context 'when valid params' do
      it do
        put history_url id: his_2017_01, params: { history: build(:his_2017_02, account: cash_stash).attributes }
        expect(response).to have_http_status :found
      end

      it 'date_of_onset is updated' do
        expect do
          put history_url id: his_2017_01, params: { history: build(:his_2017_02, account: cash_stash).attributes }
        end.to change {
          History.find(his_2017_01.id).date_of_onset
        }.from('2017-01-31'.to_date).to('2017-02-28'.to_date)
      end

      it 'account is updated' do
        expect do
          put history_url id: his_2017_01, params: { history: build(:his_2017_02, account: cash_stash).attributes }
        end.to change {
          History.find(his_2017_01.id).account.name
        }.from('Wallet').to('Cash stash')
      end

      it 'price is updated' do
        expect do
          put history_url id: his_2017_01, params: { history: build(:his_2017_02, account: cash_stash).attributes }
        end.to change {
          History.find(his_2017_01.id).price
        }.from(999).to(100)
      end

      it 'redirect' do
        put history_url id: his_2017_01, params: { history: build(:history, account: cash_stash).attributes }
        expect(response).to redirect_to History.last
      end
    end

    context 'when invalid params' do
      it do
        put history_url id: his_2017_01, params: { history: build(:history, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'date_of_onset is not updated' do
        expect do
          put history_url id: his_2017_01, params: { history: build(:history, :invalid).attributes }
        end.to_not change(History.find(his_2017_01.id), :date_of_onset)
      end

      it 'account is not updated' do
        expect do
          put history_url id: his_2017_01, params: { history: build(:history, :invalid).attributes }
        end.to_not change(History.find(his_2017_01.id), :account)
      end

      it 'price is not updated' do
        expect do
          put history_url id: his_2017_01, params: { history: build(:history, :invalid).attributes }
        end.to_not change(History.find(his_2017_01.id), :price)
      end

      it 'display an errors' do
        put history_url id: his_2017_01, params: { history: build(:history, :invalid).attributes }
        expect(response.body).to include 'prohibited this history from being saved'
      end
    end

    context 'DELETE histories/destroy' do
      let!(:history) { create(:history) }

      it do
        delete history_url id: history
        expect(response).to have_http_status :found
      end

      it 'is delete history' do
        expect do
          delete history_url id: history
        end.to change(History, :count).by(-1)
      end

      it 'redirect' do
        delete history_url id: history
        expect(response).to redirect_to(histories_url)
      end
    end
  end

  describe 'json' do
    let(:headers) do
      { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    end

    describe 'GET histories.json' do
      before do
        create_list(:history, 2)
        get histories_url, headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get list of histories' do
        expect(response.body).to have_json_size 2
      end
    end

    describe 'GET histories/1.json' do
      before do
        get history_url(id: create(:history)), headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get history' do
        expect(response.body).to have_json_path 'id'
        expect(response.body).to have_json_path 'date_of_onset'
        expect(response.body).to have_json_path 'account_id'
        expect(response.body).to have_json_path 'price'
      end
    end
  end
end
