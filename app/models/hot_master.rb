require 'csv'
class HotMaster < ActiveRecord::Base
  self.primary_key = "c"
  belongs_to :price_master, :foreign_key => "i"
  belongs_to :gs1_master, :foreign_key => "f"

# PK:c
  def self.input(file)
    HotMaster.transaction do
      delete_all
      imported_num = 0
      hot_master_list = [] #bulk
      # 文字コード変換のためにKernel#openとCSV#newを併用。
      # 参考: http://qiita.com/labocho/items/8559576b71642b79df67
      open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
        csv = CSV.new(f, :headers => :first_row)
        csv.each do |row|
          next if row.header_row?

          # CSVの行情報をHASHに変換
          table = Hash[[row.headers, row.fields].transpose]

          # 登録済み情報取得。
          # 登録されてなければ作成
          hot_master = find_by(:f => table["f"])
          if hot_master.nil?
            hot_master = new
          end

          # 情報更新
          hot_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :created_at, :updated_at).keys)
          # バリデーションOKの場合は保存
          if hot_master.valid?
            hot_master_list << hot_master
            imported_num += 1
          end
        end
      end
      HotMaster.import hot_master_list
      # 更新件数を返却
      imported_num
    end
  rescue => e
    p  e.message
  end

end
