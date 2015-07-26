require 'csv'
class HotMaster < ActiveRecord::Base
  #2015/7現在、HOTマスタを軸としている。JANコードが主流であり、HOTマスタが最も多いから。
  # self.primary_key = "a"
  belongs_to :price_master, :foreign_key => "i", :primary_key => "c"
  belongs_to :gs1_master, :foreign_key => "f", :primary_key => "ce"

  def self.input(file)
    HotMaster.transaction do
      delete_all
      imported_num = 0
      hot_master_list = []

      open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
        csv = CSV.new(f, :headers => :first_row)
        csv.each do |row|
          next if row.header_row?
          table = Hash[[row.headers, row.fields].transpose]

          hot_master = new
          hot_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :created_at, :updated_at).keys)

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
