class HotMastersController < ApplicationController
  before_action :set_hot_master, only: [:show, :edit, :update, :destroy]

  def input
    if params[:csv_file].blank?
      redirect_to(hot_masters_url, notice: 'インポートするCSVファイルを選択してください')
    elsif params[:csv_file].original_filename.eql?('hot_master.csv')
      num = HotMaster.input(params[:csv_file])
      redirect_to(hot_masters_url, notice: "#{num.to_s}件の情報を追加 / 更新しました")
    else
      redirect_to(hot_masters_url, notice: 'インポートするCSVファイルが異なります')
    end
  end

  def delete_all
    HotMaster.delete_all
    respond_to do |format|
      format.html { redirect_to hot_masters_url, notice: 'Hot master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /hot_masters
  # GET /hot_masters.json
  def index
    @hot_masters = HotMaster.page(params[:page])
    # @hot_masters = HotMaster.all
  end

  # GET /hot_masters/1
  # GET /hot_masters/1.json
  def show
  end

  # GET /hot_masters/new
  def new
    @hot_master = HotMaster.new
  end

  # GET /hot_masters/1/edit
  def edit
  end

  # POST /hot_masters
  # POST /hot_masters.json
  def create
    @hot_master = HotMaster.new(hot_master_params)

    respond_to do |format|
      if @hot_master.save
        format.html { redirect_to @hot_master, notice: 'Hot master was successfully created.' }
        format.json { render :show, status: :created, location: @hot_master }
      else
        format.html { render :new }
        format.json { render json: @hot_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hot_masters/1
  # PATCH/PUT /hot_masters/1.json
  def update
    respond_to do |format|
      if @hot_master.update(hot_master_params)
        format.html { redirect_to @hot_master, notice: 'Hot master was successfully updated.' }
        format.json { render :show, status: :ok, location: @hot_master }
      else
        format.html { render :edit }
        format.json { render json: @hot_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hot_masters/1
  # DELETE /hot_masters/1.json
  def destroy
    @hot_master.destroy
    respond_to do |format|
      format.html { redirect_to hot_masters_url, notice: 'Hot master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hot_master
    @hot_master = HotMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hot_master_params
    params.require(:hot_master).permit(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd)
  end
end
