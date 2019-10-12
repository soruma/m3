# frozen_string_literal: true

class AccountsController < ApplicationController
  include RenderCsv

  before_action :set_account, only: %i[show edit update destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.referential
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show; end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit; end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: t('controller.success_create', model: Account.model_name.human) }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: t('controller.success_update', model: Account.model_name.human) }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy # rubocop:disable Metrics/MethodLength
    respond_to do |format|
      if @account.destroy
        format.html do
          redirect_to accounts_url,
                      notice: t('controller.success_destroy', model: Account.model_name.human)
        end
        format.json { head :no_content }
      else
        format.html { redirect_to accounts_url, alert: @account.errors.full_messages.join(' ') }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /accounts/import
  def import # rubocop:disable Metrics/MethodLength
    message = begin
      Account.csv_file_import(params[:file])
      { notice: t('controller.success_import', model: Account.model_name.human) }
              rescue ActiveRecord::RecordInvalid
                { alert: t('controller.unsuccess_import_record_invalid', model: Account.model_name.human) }
              rescue NoMethodError
                { alert: t('controller.unsuccess_import_no_choose', model: Account.model_name.human) }
    end
    respond_to do |format|
      format.html { redirect_to accounts_url, message }
      format.json { head :no_content }
    end
  end

  # GET /accounts/export
  def export
    respond_to do |format|
      format.html { redirect_to action: :export, format: :csv }
      format.csv do
        render_csv Account.to_csv(Account.all),
                   file_name: Account.model_name.human,
                   charset: 'cp932'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:use_id, :name)
  end
end
