require 'csv'
class PriceMaster < ActiveRecord::Base
  self.primary_key = "c"
  has_many :hot_masters
  belongs_to :regulation_master, :foreign_key => "ad"

# PK:c
  def self.import(file)
    PriceMaster.transaction do
      destroy_all
      imported_num = 0

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
          price_master = find_by(:c => table["c"])
          if price_master.nil?
            price_master = new
          end

          # 情報更新
          price_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce, :created_at, :updated_at).keys)
          # バリデーションOKの場合は保存
          if price_master.valid?
            price_master.save!
            imported_num += 1
          end
        end
      end
      # 更新件数を返却
      imported_num
    end
  rescue => e
    p  e.message
  end

end