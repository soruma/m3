# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe HistoriesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # History. As you add validations to History, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    build(:history).attributes
  end

  let(:invalid_attributes) do
    build(:invalid_history).attributes
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HistoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:import_file) do
    fixture_file_upload('spec/fixtures/csv/history.csv', 'text/comma-separated-values')
  end

  let(:mismatch_import_file) do
    fixture_file_upload('spec/fixtures/csv/history_mismatch.csv', 'text/comma-separated-values')
  end

  describe 'GET #index' do
    it 'assigns all histories as @histories' do
      history = History.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:histories)).to eq([history])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested history as @history' do
      history = History.create! valid_attributes
      get :show, params: { id: history.to_param }, session: valid_session
      expect(assigns(:history)).to eq(history)
    end
  end

  describe 'GET #new' do
    it 'assigns a new history as @history' do
      get :new, params: {}, session: valid_session
      expect(assigns(:history)).to be_a_new(History)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested history as @history' do
      history = History.create! valid_attributes
      get :edit, params: { id: history.to_param }, session: valid_session
      expect(assigns(:history)).to eq(history)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new History' do
        expect do
          post :create, params: { history: valid_attributes }, session: valid_session
        end.to change(History, :count).by(1)
      end

      it 'assigns a newly created history as @history' do
        post :create, params: { history: valid_attributes }, session: valid_session
        expect(assigns(:history)).to be_a(History)
        expect(assigns(:history)).to be_persisted
      end

      it 'redirects to the created history' do
        post :create, params: { history: valid_attributes }, session: valid_session
        expect(response).to redirect_to(History.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved history as @history' do
        post :create, params: { history: invalid_attributes }, session: valid_session
        expect(assigns(:history)).to be_a_new(History)
      end

      it "re-renders the 'new' template" do
        post :create, params: { history: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        build(:update_history).attributes
      end

      it 'updates the requested history' do
        history = History.create! valid_attributes
        put :update, params: { id: history.to_param, history: new_attributes }, session: valid_session
        history.reload
        expect(controller.notice).to eq(I18n.t('controller.success_update', model: History.model_name.human))
      end

      it 'assigns the requested history as @history' do
        history = History.create! valid_attributes
        put :update, params: { id: history.to_param, history: valid_attributes }, session: valid_session
        expect(assigns(:history)).to eq(history)
      end

      it 'redirects to the history' do
        history = History.create! valid_attributes
        put :update, params: { id: history.to_param, history: valid_attributes }, session: valid_session
        expect(response).to redirect_to(history)
      end
    end

    context 'with invalid params' do
      it 'assigns the history as @history' do
        history = History.create! valid_attributes
        put :update, params: { id: history.to_param, history: invalid_attributes }, session: valid_session
        expect(assigns(:history)).to eq(history)
      end

      it "re-renders the 'edit' template" do
        history = History.create! valid_attributes
        put :update, params: { id: history.to_param, history: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested history' do
      history = History.create! valid_attributes
      expect do
        delete :destroy, params: { id: history.to_param }, session: valid_session
      end.to change(History, :count).by(-1)
    end

    it 'redirects to the histories list' do
      history = History.create! valid_attributes
      delete :destroy, params: { id: history.to_param }, session: valid_session
      expect(response).to redirect_to(histories_url)
    end
  end

  describe 'POST #import' do
    before :each do
      csv = fixture_file_upload('spec/fixtures/csv/use.csv', 'text/comma-separated-values')
      Use.csv_file_import(csv)
      csv = fixture_file_upload('spec/fixtures/csv/account.csv', 'text/comma-separated-values')
      Account.csv_file_import(csv)
    end

    context 'with valid import data' do
      it 'csv file upload' do
        expect do
          post :import, params: { file: import_file }, session: valid_session
        end.to change(History, :count).by(6)
        expect(response).to redirect_to(histories_url)
        expect(controller.notice).to eq(I18n.t('controller.success_import', model: History.model_name.human))
      end
    end

    context 'with invalid import data' do
      it 'not upload file' do
        expect do
          post :import, params: { file: nil }, session: valid_session
        end.to change(History, :count).by(0)
        expect(response).to redirect_to(histories_url)
        expect(controller.alert).to eq(I18n.t('controller.unsuccess_import_no_choose', model: History.model_name.human))
      end

      it 'import format mismatch' do
        expect do
          post :import, params: { file: mismatch_import_file }, session: valid_session
        end.to change(History, :count).by(0)
        expect(response).to redirect_to(histories_url)
        expect(controller.alert).to(
          eq(I18n.t('controller.unsuccess_import_record_invalid', model: History.model_name.human))
        )
      end
    end
  end

  describe 'GET #export' do
    before do
      get :import, params: { file: import_file }, session: valid_session
    end

    context 'export data exists' do
      it 'export redirect to format csv' do
        get :export, params: {}, session: valid_session
        expect(response.status).to eq(302)
        expect(response.headers.to_hash['Location']).to match(%r{histories/export.csv})
      end

      it 'csv file export' do
        get :export, params: { format: 'csv' }, session: valid_session
        expect(response).to be_success
        expect(response.headers['Content-Disposition']).to(
          match(/attachment; filename=\"#{History.model_name.human}.csv\"/)
        )
        expect(response.content_type).to eq('text/csv')
      end
    end
  end
end
