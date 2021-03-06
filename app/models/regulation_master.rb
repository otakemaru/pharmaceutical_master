require 'csv'
class RegulationMaster < ActiveRecord::Base
  # self.primary_key = "code"
  has_one :price_master, :primary_key => "code", :foreign_key => "ad"

  def self.input(file)
    RegulationMaster.transaction do
      delete_all
      imported_num = 0
      regulation_master_list = []

      open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
        csv = CSV.new(f, :headers => :first_row)
        csv.each do |row|
          next if row.header_row?
          table = Hash[[row.headers, row.fields].transpose]

          regulation_master = new
          regulation_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:code, :name, :created_at, :updated_at).keys)

          if regulation_master.valid?
            regulation_master_list << regulation_master
            imported_num += 1
          end
        end
      end
      RegulationMaster.import regulation_master_list
      imported_num
    end
  rescue => e
    p  e.message
  end

end
