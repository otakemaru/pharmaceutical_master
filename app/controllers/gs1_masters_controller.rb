class Gs1MastersController < ApplicationController
  before_action :set_gs1_master, only: [:show, :edit, :update, :destroy]

  def input
    if params[:csv_file].blank?
      redirect_to(gs1_masters_url, alert: INPUT_BLANK_ALERT)
    elsif params[:csv_file].original_filename.eql?('gs1_master.csv')
      num = Gs1Master.input(params[:csv_file])
      redirect_to(gs1_masters_url, notice: "#{num.to_s}" + INPUT_NOTICE)
    else
      redirect_to(gs1_masters_url, alert: INPUT_DIFFERENT_ALERT)
    end
  end

  def delete_all
    Gs1Master.delete_all
    respond_to do |format|
      format.html { redirect_to gs1_masters_url, notice: DELETE_ALL_NOTICE }
      format.json { head :no_content }
    end
  end

  # GET /gs1_masters
  # GET /gs1_masters.json
  def index
    @gs1_masters = Gs1Master.page(params[:page])
    # @gs1_masters = Gs1Master.all
  end

  # GET /gs1_masters/1
  # GET /gs1_masters/1.json
  def show
  end

  # GET /gs1_masters/new
  def new
    @gs1_master = Gs1Master.new
  end

  # GET /gs1_masters/1/edit
  def edit
  end

  # POST /gs1_masters
  # POST /gs1_masters.json
  def create
    @gs1_master = Gs1Master.new(gs1_master_params)

    respond_to do |format|
      if @gs1_master.save
        format.html { redirect_to @gs1_master, notice: CREATE_NOTICE }
        format.json { render :show, status: :created, location: @gs1_master }
      else
        format.html { render :new }
        format.json { render json: @gs1_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gs1_masters/1
  # PATCH/PUT /gs1_masters/1.json
  def update
    respond_to do |format|
      if @gs1_master.update(gs1_master_params)
        format.html { redirect_to @gs1_master, notice: UPDATE_NOTICE }
        format.json { render :show, status: :ok, location: @gs1_master }
      else
        format.html { render :edit }
        format.json { render json: @gs1_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gs1_masters/1
  # DELETE /gs1_masters/1.json
  def destroy
    @gs1_master.destroy
    respond_to do |format|
      format.html { redirect_to gs1_masters_url, notice: DELETE_NOTICE }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gs1_master
      @gs1_master = Gs1Master.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gs1_master_params
      params.require(:gs1_master).permit(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce, :cf, :cg, :ch, :ci, :cj, :da, :db, :dc, :dd)
    end
end
