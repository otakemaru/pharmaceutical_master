class RegulationMastersController < ApplicationController
  before_action :set_regulation_master, only: [:show, :edit, :update, :destroy]

  def input
    if params[:csv_file].blank?
      redirect_to(regulation_masters_url, alert: INPUT_BLANK_ALERT)
    elsif params[:csv_file].original_filename.eql?('regulation_master.csv')
      num = RegulationMaster.input(params[:csv_file])
      redirect_to(regulation_masters_url, notice: "#{num.to_s}" + INPUT_NOTICE)
    else
      redirect_to(regulation_masters_url, alert: INPUT_DIFFERENT_ALERT)
    end
  end

  def delete_all
    RegulationMaster.delete_all
    respond_to do |format|
      format.html { redirect_to regulation_masters_url, notice: DELETE_ALL_NOTICE }
      format.json { head :no_content }
    end
  end
  
  # GET /regulation_masters
  # GET /regulation_masters.json
  def index
    @regulation_masters = RegulationMaster.page(params[:page])
    # @regulation_masters = RegulationMaster.all
  end

  # GET /regulation_masters/1
  # GET /regulation_masters/1.json
  def show
  end

  # GET /regulation_masters/new
  def new
    @regulation_master = RegulationMaster.new
  end

  # GET /regulation_masters/1/edit
  def edit
  end

  # POST /regulation_masters
  # POST /regulation_masters.json
  def create
    @regulation_master = RegulationMaster.new(regulation_master_params)

    respond_to do |format|
      if @regulation_master.save
        format.html { redirect_to @regulation_master, notice: CREATE_NOTICE }
        format.json { render :show, status: :created, location: @regulation_master }
      else
        format.html { render :new }
        format.json { render json: @regulation_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regulation_masters/1
  # PATCH/PUT /regulation_masters/1.json
  def update
    respond_to do |format|
      if @regulation_master.update(regulation_master_params)
        format.html { redirect_to @regulation_master, notice: UPDATE_NOTICE }
        format.json { render :show, status: :ok, location: @regulation_master }
      else
        format.html { render :edit }
        format.json { render json: @regulation_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regulation_masters/1
  # DELETE /regulation_masters/1.json
  def destroy
    @regulation_master.destroy
    respond_to do |format|
      format.html { redirect_to regulation_masters_url, notice: DELETE_NOTICE }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regulation_master
      @regulation_master = RegulationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regulation_master_params
      params.require(:regulation_master).permit(:code, :name)
    end
end
