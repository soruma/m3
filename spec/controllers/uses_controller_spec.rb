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

RSpec.describe UsesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Use. As you add validations to Use, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for :use
  }

  let(:invalid_attributes) {
    attributes_for :invalid_use
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:import_file) {
    fixture_file_upload('spec/fixtures/csv/use.csv', 'text/comma-separated-values')
  }

  let(:mismatch_import_file) {
    fixture_file_upload('spec/fixtures/csv/use_mismatch.csv', 'text/comma-separated-values')
  }

  describe "GET #index" do
    it "assigns all uses as @uses" do
      use = Use.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:uses)).to eq([use])
    end
  end

  describe "GET #show" do
    it "assigns the requested use as @use" do
      use = Use.create! valid_attributes
      get :show, params: {id: use.to_param}, session: valid_session
      expect(assigns(:use)).to eq(use)
    end
  end

  describe "GET #new" do
    it "assigns a new use as @use" do
      get :new, params: {}, session: valid_session
      expect(assigns(:use)).to be_a_new(Use)
    end
  end

  describe "GET #edit" do
    it "assigns the requested use as @use" do
      use = Use.create! valid_attributes
      get :edit, params: {id: use.to_param}, session: valid_session
      expect(assigns(:use)).to eq(use)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Use" do
        expect {
          post :create, params: {use: valid_attributes}, session: valid_session
        }.to change(Use, :count).by(1)
      end

      it "assigns a newly created use as @use" do
        post :create, params: {use: valid_attributes}, session: valid_session
        expect(assigns(:use)).to be_a(Use)
        expect(assigns(:use)).to be_persisted
      end

      it "redirects to the created use" do
        post :create, params: {use: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Use.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved use as @use" do
        post :create, params: {use: invalid_attributes}, session: valid_session
        expect(assigns(:use)).to be_a_new(Use)
      end

      it "re-renders the 'new' template" do
        post :create, params: {use: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for :update_use
      }

      it "updates the requested use" do
        use = Use.create! valid_attributes
        put :update, params: {id: use.to_param, use: new_attributes}, session: valid_session
        use.reload
        expect(controller.notice).to eq("Use was successfully updated.")
      end

      it "assigns the requested use as @use" do
        use = Use.create! valid_attributes
        put :update, params: {id: use.to_param, use: valid_attributes}, session: valid_session
        expect(assigns(:use)).to eq(use)
      end

      it "redirects to the use" do
        use = Use.create! valid_attributes
        put :update, params: {id: use.to_param, use: valid_attributes}, session: valid_session
        expect(response).to redirect_to(use)
      end
    end

    context "with invalid params" do
      it "assigns the use as @use" do
        use = Use.create! valid_attributes
        put :update, params: {id: use.to_param, use: invalid_attributes}, session: valid_session
        expect(assigns(:use)).to eq(use)
      end

      it "re-renders the 'edit' template" do
        use = Use.create! valid_attributes
        put :update, params: {id: use.to_param, use: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:destroy_foreign_key_data) {
      build(:account).attributes
    }

    it "destroys the requested use" do
      use = Use.create! valid_attributes
      expect {
        delete :destroy, params: {id: use.to_param}, session: valid_session
      }.to change(Use, :count).by(-1)
    end

    it "redirects to the uses list" do
      use = Use.create! valid_attributes
      delete :destroy, params: {id: use.to_param}, session: valid_session
      expect(response).to redirect_to(uses_url)
    end

    it "treatment foreign key error" do
      account = Account.create! destroy_foreign_key_data
      expect {
        delete :destroy, params: {id: account.use.id}, session: valid_session
      }.to change(Use, :count).by(0)
      expect(controller.alert).to eq("Use was unsuccessfully destroy.<br/>Associated tables exist.")
    end
  end

  describe "POST #import" do
    context "with valid import data" do
      it "csv file upload" do
        expect {
          post :import, params: {file: import_file}, session: valid_session
        }.to change(Use, :count).by(2)
        expect(response).to redirect_to(uses_url)
        expect(controller.notice).to eq("Use was successfully imports.")
      end
    end

    context "with invalid import data" do
      it "not upload file" do
        expect {
          post :import, params: {file: nil}, session: valid_session
        }.to change(Use, :count).by(0)
        expect(response).to redirect_to(uses_url)
        expect(controller.alert).to eq("Use was unsuccessfully imports.<br/>Please choose the file to be import.")
      end

      it "import format mismatch" do
        expect {
          post :import, params: {file: mismatch_import_file}, session: valid_session
        }.to change(Use, :count).by(0)
        expect(response).to redirect_to(uses_url)
        expect(controller.alert).to eq("Use was unsuccessfully imports.<br/>The file format is different.")
      end
    end
  end

  describe "POST #export" do
    before {
      post :import, params: {file: import_file}, session: valid_session
    }

    context "export data exists" do
      it "export redirect to format csv" do
        post :export, params: {}, session: valid_session
        expect(response.status).to eq(302)
        expect(response.headers.to_hash['Location']).to match(/uses\/export.csv/)
      end

      it "csv file export" do
        post :export, params: {:format => 'csv'}, session: valid_session
        expect(response).to be_success
        expect(response.headers["Content-Disposition"]).to match(/attachment; filename=\"use.csv\"/)
        expect(response.content_type).to eq("text/csv")
      end
    end
  end
end
