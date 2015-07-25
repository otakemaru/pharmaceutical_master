require 'csv'
class Gs1Master < ActiveRecord::Base
  #ccが本来の主キーなので、HOTマスタとの従属を検討する
  self.primary_key = "ce"
  has_one :hot_master

  def self.input(file)
    Gs1Master.transaction do
      delete_all
      imported_num = 0
      gs1_master_list = []
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
          gs1_master = find_by(:cc => table["cc"])
          if gs1_master.nil?
            gs1_master = new
          end

          # 情報更新
          gs1_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce, :cf, :cg, :ch, :ci, :cj, :da, :db, :dc, :dd, :created_at, :updated_at).keys)
          # バリデーションOKの場合は保存
          if gs1_master.valid?
            gs1_master_list << gs1_master
            imported_num += 1
          end
        end
      end
      Gs1Master.import gs1_master_list
      # 更新件数を返却
      imported_num
    end
  rescue => e
    p  e.message
  end

end
