class PharmaceuticalMastersController < ApplicationController
  before_action :set_pharmaceutical_master, only: [:show, :edit, :update, :destroy]

  def integrate
    num = PharmaceuticalMaster.integrate
    redirect_to(pharmaceutical_masters_url, notice: "#{num.to_s}件の情報を追加 / 更新しました")
  end

  def export_csv
    @pharmaceutical_masters = PharmaceuticalMaster.all
    send_data @pharmaceutical_masters.to_csv, filename: "医薬品マスタ_#{Time.current.strftime('%Y%m%d')}.csv"
  end

  def delete_all
    PharmaceuticalMaster.delete_all
    respond_to do |format|
      format.html { redirect_to pharmaceutical_masters_url, notice: 'Pharmaceutical master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /pharmaceutical_masters
  # GET /pharmaceutical_masters.json
  def index
    @pharmaceutical_masters = PharmaceuticalMaster.page(params[:page])
    # @pharmaceutical_masters = PharmaceuticalMaster.all
  end

  # GET /pharmaceutical_masters/1
  # GET /pharmaceutical_masters/1.json
  def show
  end

  # GET /pharmaceutical_masters/new
  def new
    @pharmaceutical_master = PharmaceuticalMaster.new
  end

  # GET /pharmaceutical_masters/1/edit
  def edit
  end

  # POST /pharmaceutical_masters
  # POST /pharmaceutical_masters.json
  def create
    @pharmaceutical_master = PharmaceuticalMaster.new(pharmaceutical_master_params)

    respond_to do |format|
      if @pharmaceutical_master.save
        format.html { redirect_to @pharmaceutical_master, notice: 'Pharmaceutical master was successfully created.' }
        format.json { render :show, status: :created, location: @pharmaceutical_master }
      else
        format.html { render :new }
        format.json { render json: @pharmaceutical_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmaceutical_masters/1
  # PATCH/PUT /pharmaceutical_masters/1.json
  def update
    respond_to do |format|
      if @pharmaceutical_master.update(pharmaceutical_master_params)
        format.html { redirect_to @pharmaceutical_master, notice: 'Pharmaceutical master was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmaceutical_master }
      else
        format.html { render :edit }
        format.json { render json: @pharmaceutical_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmaceutical_masters/1
  # DELETE /pharmaceutical_masters/1.json
  def destroy
    @pharmaceutical_master.destroy
    respond_to do |format|
      format.html { redirect_to pharmaceutical_masters_url, notice: 'Pharmaceutical master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmaceutical_master
      @pharmaceutical_master = PharmaceuticalMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmaceutical_master_params
      params.require(:pharmaceutical_master).permit(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag)
    end
end
