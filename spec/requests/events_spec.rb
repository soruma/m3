# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET events/index' do
    before do
      create(:new_years_day)
      create(:christmas_day)

      get events_url
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include date_of_onset' do
      expect(response.body).to include '2019-01-01'
      expect(response.body).to include '2019-12-25'
    end

    it 'response.body include name' do
      expect(response.body).to include ERB::Util.html_escape(%(New Year's Day))
      expect(response.body).to include 'Christmas Day'
    end
  end

  describe 'GET events/show' do
    before do
      get event_url id: create(:new_years_day)
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include date_of_onset' do
      expect(response.body).to include '2019-01-01'
    end

    it 'response.body include name' do
      expect(response.body).to include ERB::Util.html_escape(%(New Year's Day))
    end
  end

  describe 'GET events/new' do
    before do
      get new_event_url
    end

    it do
      expect(response).to have_http_status :success
    end
  end

  describe 'GET events/edit' do
    before do
      get edit_event_url id: create(:new_years_day)
    end

    it do
      expect(response).to have_http_status :success
    end

    it 'response.body include date_of_onset' do
      expect(response.body).to include '<option value="2019" selected="selected">2019</option>'
      expect(response.body).to include '<option value="1" selected="selected">January</option>'
      expect(response.body).to include '<option value="1" selected="selected">1</option>'
    end

    it 'response.body include name' do
      expect(response.body).to include ERB::Util.html_escape(%(New Year's Day))
    end
  end

  describe 'POST events/create' do
    context 'when valid params' do
      it do
        post events_url params: { event: build(:event).attributes }
        expect(response).to have_http_status :found
      end

      it 'evnet can registration' do
        expect do
          post events_url params: { event: build(:event).attributes }
        end.to change(Event, :count).by(1)
      end

      it 'redirect' do
        post events_url params: { event: build(:event).attributes }
        expect(response).to redirect_to Event.last
      end
    end

    context 'when invalid params' do
      it do
        post events_url params: { event: build(:event, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'evnet can not registration' do
        expect do
          post events_url params: { event: build(:event, :invalid).attributes }
        end.to_not change(Event, :count)
      end

      it 'display an errors' do
        post events_url params: { event: build(:event, :invalid).attributes }
        expect(response.body).to include 'prohibited this event from being saved'
      end
    end
  end

  describe 'PUT events/update' do
    let(:new_years_day) { create(:new_years_day) }

    context 'when valid params' do
      it do
        put event_url id: new_years_day.id, params: { event: build(:christmas_day).attributes }
        expect(response).to have_http_status :found
      end

      it 'date_of_onset is updated' do
        expect do
          put event_url id: new_years_day.id, params: { event: build(:christmas_day).attributes }
        end.to change {
          Event.find(new_years_day.id).date_of_onset
        }.from('2019-01-01'.to_date).to('2019-12-25'.to_date)
      end

      it 'name is updated' do
        expect do
          put event_url id: new_years_day.id, params: { event: build(:christmas_day).attributes }
        end.to change {
          Event.find(new_years_day.id).name
        }.from(%(New Year's Day)).to('Christmas Day')
      end

      it 'redirect' do
        put event_url id: new_years_day.id, params: { event: build(:event).attributes }
        expect(response).to redirect_to Event.last
      end
    end

    context 'when invalid params' do
      it do
        put event_url id: new_years_day, params: { event: build(:event, :invalid).attributes }
        expect(response).to have_http_status :success
      end

      it 'date_of_onset is not updated' do
        expect do
          put event_url id: new_years_day, params: { event: build(:event, :invalid).attributes }
        end.to_not change(Event.find(new_years_day.id), :date_of_onset)
      end

      it 'name is not updated' do
        expect do
          put event_url id: new_years_day, params: { event: build(:event, :invalid).attributes }
        end.to_not change(Event.find(new_years_day.id), :name)
      end

      it 'display an errors' do
        put event_url id: new_years_day, params: { event: build(:event, :invalid).attributes }
        expect(response.body).to include 'prohibited this event from being saved'
      end
    end

    context 'DELETE events/destroy' do
      let!(:event) { create(:event) }

      it do
        delete event_url id: event
        expect(response).to have_http_status :found
      end

      it 'is delete event' do
        expect do
          delete event_url id: event
        end.to change(Event, :count).by(-1)
      end

      it 'redirect' do
        delete event_url id: event
        expect(response).to redirect_to(events_url)
      end
    end
  end

  describe 'json' do
    let(:headers) do
      { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    end

    describe 'GET events.json' do
      before do
        create_list(:event, 2)
        get events_url, headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get list of events' do
        expect(response.body).to have_json_size 2
      end
    end

    describe 'GET events/1.json' do
      before do
        get event_url(id: create(:event)), headers: headers
      end

      it 'request is successful' do
        expect(response).to have_http_status :success
      end

      it 'can get event' do
        expect(response.body).to have_json_path 'id'
        expect(response.body).to have_json_path 'date_of_onset'
        expect(response.body).to have_json_path 'name'
      end
    end
  end
end
