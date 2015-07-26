require 'csv'
class EfficacyMaster < ActiveRecord::Base
  self.primary_key = "code"

  def self.input(file)
    EfficacyMaster.transaction do
      delete_all
      imported_num = 0
      efficacy_master_list = []

      open(file.path, 'r:cp932:utf-8', undef: :replace) do |f|
        csv = CSV.new(f, :headers => :first_row)
        csv.each do |row|
          next if row.header_row?
          table = Hash[[row.headers, row.fields].transpose]

          efficacy_master = new
          efficacy_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:code, :name, :created_at, :updated_at).keys)

          if efficacy_master.valid?
            efficacy_master_list << efficacy_master
            imported_num += 1
          end
        end
      end
      EfficacyMaster.import efficacy_master_list

      imported_num
    end
  rescue => e
    p  e.message
  end

end
