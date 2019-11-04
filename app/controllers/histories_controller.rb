# frozen_string_literal: true

class HistoriesController < ApplicationController
  include RenderCsv
  include ImportFile
  include ExportFile

  before_action :set_history, only: %i[show edit update destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.referential.account_book.page(params[:page])
  end

  # GET /histories/1
  # GET /histories/1.json
  def show; end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit; end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: t('controller.success_create', model: History.model_name.human) }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: t('controller.success_update', model: History.model_name.human) }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html do
        redirect_to histories_url,
                    notice: t('controller.success_destroy', model: History.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_history
    @history = History.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def history_params
    params.require(:history).permit(:date_of_onset, :account_id, :price)
  end
end
