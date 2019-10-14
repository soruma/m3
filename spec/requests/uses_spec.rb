# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Uses' do
  describe 'GET uses/index' do
    before do
      create(:usually_use)
      create(:saving)

      get uses_url
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include name' do
      expect(response.body).to include 'Usually use'
      expect(response.body).to include 'Saving'
    end
  end

  describe 'GET uses/show' do
    before do
      get use_url id: create(:usually_use)
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include name' do
      expect(response.body).to include 'Usually use'
    end
  end

  describe 'GET uses/new' do
    before do
      get new_use_url
    end

    it do
      expect(response).to have_http_status :success
    end
  end

  describe 'GET uses/edit' do
    before do
      get edit_use_url id: create(:usually_use)
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include name' do
      expect(response.body).to include 'Usually use'
    end
  end

  describe 'POST uses/create' do
    context 'when valid params' do
      it do
        post uses_url params: { use: build(:use).attributes }
        expect(response).to have_http_status :found
      end

      it 'use can registration' do
        expect do
          post uses_url params: { use: build(:use).attributes }
        end.to change(Use, :count).by(1)
      end

      it 'redirect' do
        post uses_url params: { use: build(:use).attributes }
        expect(response).to redirect_to Use.last
      end
    end

    context 'when invalid params' do
      it do
        post uses_url params: { use: build(:use, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'use can not registration' do
        expect do
          post uses_url params: { use: build(:use, :invalid).attributes }
        end.to_not change(Use, :count)
      end

      it 'display an errors' do
        post uses_url params: { use: build(:use, :invalid).attributes }
        expect(response.body).to include 'prohibited this use from being saved'
      end
    end
  end

  describe 'PUT uses/update' do
    let(:usually_use) { create(:usually_use) }

    context 'when valid params' do
      it do
        put use_url id: usually_use, params: { use: build(:saving).attributes }
        expect(response).to have_http_status :found
      end

      it 'name is updated' do
        expect do
          put use_url id: usually_use, params: { use: build(:saving).attributes }
        end.to change {
          Use.find(usually_use.id).name
        }.from('Usually use').to('Saving')
      end

      it 'redirect' do
        put use_url id: usually_use, params: { use: build(:use).attributes }
        expect(response).to redirect_to Use.last
      end
    end

    context 'when invalid params' do
      it do
        put use_url id: usually_use, params: { use: build(:use, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'name is not updated' do
        expect do
          put use_url id: usually_use, params: { use: build(:use, :invalid).attributes }
        end.to_not change(Use.find(usually_use.id), :name)
      end

      it 'display an errors' do
        put use_url id: usually_use, params: { use: build(:use, :invalid).attributes }
        expect(response.body).to include 'prohibited this use from being saved'
      end
    end

    context 'DELETE uses/destroy' do
      context 'when delete is successful' do
        let!(:use) { create(:use) }

        it do
          delete use_url id: use
          expect(response).to have_http_status :found
        end

        it 'is delete use' do
          expect do
            delete use_url id: use
          end.to change(Use, :count).by(-1)
        end

        it 'redirect' do
          delete use_url id: use
          expect(response).to redirect_to(uses_url)
        end
      end

      context 'when delete is faild' do
        let!(:use) { create(:use) }

        before { create(:account, use: use) }

        it do
          delete use_url id: use
          expect(response).to have_http_status :found
        end

        it 'is not delete use' do
          expect do
            delete use_url id: use
          end.not_to change(Use, :count)
        end

        it 'redirect' do
          delete use_url id: use
          expect(response).to redirect_to(uses_url)
        end
      end
    end
  end

  describe 'json' do
    let(:headers) do
      { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    end

    describe 'GET uses.json' do
      before do
        create_list(:use, 2)
        get uses_url, headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get list of uses' do
        expect(response.body).to have_json_size 2
      end
    end

    describe 'GET uses/1.json' do
      before do
        get use_url(id: create(:use)), headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get use' do
        expect(response.body).to have_json_path 'id'
        expect(response.body).to have_json_path 'name'
      end
    end
  end
end
