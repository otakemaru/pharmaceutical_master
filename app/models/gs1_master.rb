require 'csv'
class Gs1Master < ActiveRecord::Base
  #本来、販売包装単位コード(cc)がGS1マスタの主キーなので、HOTマスタを右外部結合したい
  self.primary_key = "ce"
  has_one :hot_master

  def self.input(file)
    Gs1Master.transaction do
      delete_all
      imported_num = 0
      gs1_master_list = []

      open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
        csv = CSV.new(f, :headers => :first_row)
        csv.each do |row|
          next if row.header_row?
          table = Hash[[row.headers, row.fields].transpose]

          gs1_master = new
          gs1_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce, :cf, :cg, :ch, :ci, :cj, :da, :db, :dc, :dd, :created_at, :updated_at).keys)

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
