class EfficacyMastersController < ApplicationController
  before_action :set_efficacy_master, only: [:show, :edit, :update, :destroy]

  def input
    if params[:csv_file].blank?
      redirect_to(efficacy_masters_url, alert: INPUT_BLANK_ALERT)
    elsif params[:csv_file].original_filename.eql?('efficacy_master.csv')
      num = EfficacyMaster.input(params[:csv_file])
      redirect_to(efficacy_masters_url, notice: "#{num.to_s}" + INPUT_NOTICE)
    else
      redirect_to(efficacy_masters_url, alert: INPUT_DIFFERENT_ALERT)
    end
  end

  def delete_all
    EfficacyMaster.delete_all
    respond_to do |format|
      format.html { redirect_to efficacy_masters_url, notice: DELETE_ALL_NOTICE }
      format.json { head :no_content }
    end
  end

  # GET /efficacy_masters
  # GET /efficacy_masters.json
  def index
    @efficacy_masters = EfficacyMaster.page(params[:page])
    # @efficacy_masters = EfficacyMaster.all
  end

  # GET /efficacy_masters/1
  # GET /efficacy_masters/1.json
  def show
  end

  # GET /efficacy_masters/new
  def new
    @efficacy_master = EfficacyMaster.new
  end

  # GET /efficacy_masters/1/edit
  def edit
  end

  # POST /efficacy_masters
  # POST /efficacy_masters.json
  def create
    @efficacy_master = EfficacyMaster.new(efficacy_master_params)

    respond_to do |format|
      if @efficacy_master.save
        format.html { redirect_to @efficacy_master, notice: CREATE_NOTICE }
        format.json { render :show, status: :created, location: @efficacy_master }
      else
        format.html { render :new }
        format.json { render json: @efficacy_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /efficacy_masters/1
  # PATCH/PUT /efficacy_masters/1.json
  def update
    respond_to do |format|
      if @efficacy_master.update(efficacy_master_params)
        format.html { redirect_to @efficacy_master, notice: UPDATE_NOTICE }
        format.json { render :show, status: :ok, location: @efficacy_master }
      else
        format.html { render :edit }
        format.json { render json: @efficacy_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /efficacy_masters/1
  # DELETE /efficacy_masters/1.json
  def destroy
    @efficacy_master.destroy
    respond_to do |format|
      format.html { redirect_to efficacy_masters_url, notice: DELETE_NOTICE }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_efficacy_master
      @efficacy_master = EfficacyMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def efficacy_master_params
      params.require(:efficacy_master).permit(:code, :name)
    end
end
