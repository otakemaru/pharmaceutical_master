class PriceMastersController < ApplicationController
  before_action :set_price_master, only: [:show, :edit, :update, :destroy]

  def import
    if params[:csv_file].blank?
      redirect_to(price_masters_url, notice: 'インポートするCSVファイルを選択してください')
    elsif params[:csv_file].original_filename.eql?('price_master.csv')
      num = PriceMaster.import(params[:csv_file])
      redirect_to(price_masters_url, notice: "#{num.to_s}件の情報を追加 / 更新しました")
    else
      redirect_to(price_masters_url, notice: 'インポートするCSVファイルが異なります')
    end
  end

  def delete_all
    PriceMaster.delete_all
    respond_to do |format|
      format.html { redirect_to price_masters_url, notice: 'Price master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /price_masters
  # GET /price_masters.json
  def index
    @price_masters = PriceMaster.page(params[:page])
    # @price_masters = PriceMaster.all
  end

  # GET /price_masters/1
  # GET /price_masters/1.json
  def show
  end

  # GET /price_masters/new
  def new
    @price_master = PriceMaster.new
  end

  # GET /price_masters/1/edit
  def edit
  end

  # POST /price_masters
  # POST /price_masters.json
  def create
    @price_master = PriceMaster.new(price_master_params)

    respond_to do |format|
      if @price_master.save
        format.html { redirect_to @price_master, notice: 'Price master was successfully created.' }
        format.json { render :show, status: :created, location: @price_master }
      else
        format.html { render :new }
        format.json { render json: @price_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_masters/1
  # PATCH/PUT /price_masters/1.json
  def update
    respond_to do |format|
      if @price_master.update(price_master_params)
        format.html { redirect_to @price_master, notice: 'Price master was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_master }
      else
        format.html { render :edit }
        format.json { render json: @price_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_masters/1
  # DELETE /price_masters/1.json
  def destroy
    @price_master.destroy
    respond_to do |format|
      format.html { redirect_to price_masters_url, notice: 'Price master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_master
      @price_master = PriceMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_master_params
      params.require(:price_master).permit(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce)
    end
end
