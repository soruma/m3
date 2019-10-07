# frozen_string_literal: true

class UsesController < ApplicationController
  include RenderCsv

  before_action :set_use, only: %i[show edit update destroy]

  # GET /uses
  # GET /uses.json
  def index
    @uses = Use.all
  end

  # GET /uses/1
  # GET /uses/1.json
  def show; end

  # GET /uses/new
  def new
    @use = Use.new
  end

  # GET /uses/1/edit
  def edit; end

  # POST /uses
  # POST /uses.json
  def create
    @use = Use.new(use_params)

    respond_to do |format|
      if @use.save
        format.html { redirect_to @use, notice: t('controller.success_create', model: Use.model_name.human) }
        format.json { render :show, status: :created, location: @use }
      else
        format.html { render :new }
        format.json { render json: @use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uses/1
  # PATCH/PUT /uses/1.json
  def update
    respond_to do |format|
      if @use.update(use_params)
        format.html { redirect_to @use, notice: t('controller.success_update', model: Use.model_name.human) }
        format.json { render :show, status: :ok, location: @use }
      else
        format.html { render :edit }
        format.json { render json: @use.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uses/1
  # DELETE /uses/1.json
  def destroy
    respond_to do |format|
      if @use.destroy
        format.html { redirect_to uses_url, notice: t('controller.success_destroy', model: Use.model_name.human) }
        format.json { head :no_content }
      else
        format.html { redirect_to uses_url, alert: @use.errors.full_messages.join(' ') }
        format.json { render json: @use.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /uses/import
  def import
    message = begin
      Use.csv_file_import(params[:file])
      { notice: t('controller.success_import', model: Use.model_name.human) }
              rescue ActiveRecord::RecordInvalid
                { alert: t('controller.unsuccess_import_record_invalid', model: Use.model_name.human) }
              rescue NoMethodError
                { alert: t('controller.unsuccess_import_no_choose', model: Use.model_name.human) }
    end
    respond_to do |format|
      format.html { redirect_to uses_url, message }
      format.json { head :no_content }
    end
  end

  # GET /uses/export
  def export
    respond_to do |format|
      format.html { redirect_to action: :export, format: :csv }
      format.csv do
        render_csv Use.to_csv(Use.all),
                   file_name: Use.model_name.human,
                   charset: 'cp932'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_use
    @use = Use.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def use_params
    params.require(:use).permit(:name)
  end
end
