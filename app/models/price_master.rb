require 'csv'
class PriceMaster < ActiveRecord::Base
  # self.primary_key = "c"
  has_many :hot_masters, :primary_key => "c", :foreign_key => "i"
  belongs_to :regulation_master, :foreign_key => "ad", :primary_key => "code"

  def self.input(file)
    PriceMaster.transaction do
      delete_all
      imported_num = 0
      price_master_list = []

      open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
        csv = CSV.new(f, :headers => :first_row)
        csv.each do |row|
          next if row.header_row?
          table = Hash[[row.headers, row.fields].transpose]

          price_master = new
          price_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce, :created_at, :updated_at).keys)

          if price_master.valid?
            price_master_list << price_master
            imported_num += 1
          end
        end
      end
      PriceMaster.import price_master_list
      imported_num
    end
  rescue => e
    p  e.message
  end

end
