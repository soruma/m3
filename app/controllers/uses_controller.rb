class UsesController < ApplicationController
  before_action :set_use, only: [:show, :edit, :update, :destroy]

  # GET /uses
  # GET /uses.json
  def index
    @uses = Use.all
  end

  # GET /uses/1
  # GET /uses/1.json
  def show
  end

  # GET /uses/new
  def new
    @use = Use.new
  end

  # GET /uses/1/edit
  def edit
  end

  # POST /uses
  # POST /uses.json
  def create
    @use = Use.new(use_params)

    respond_to do |format|
      if @use.save
        format.html { redirect_to @use, notice: 'Use was successfully created.' }
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
        format.html { redirect_to @use, notice: 'Use was successfully updated.' }
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
    @use.destroy
    respond_to do |format|
      format.html { redirect_to uses_url, notice: 'Use was successfully destroyed.' }
      format.json { head :no_content }
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
