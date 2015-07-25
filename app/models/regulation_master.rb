require 'csv'
class RegulationMaster < ActiveRecord::Base
  self.primary_key = "code"
  has_one :price_master

# PK:code
  def self.import(file)
    RegulationMaster.transaction do
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
          regulation_master = find_by(:code => table["code"])
          if regulation_master.nil?
            regulation_master = new
          end

          # 情報更新
          regulation_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:code, :name, :created_at, :updated_at).keys)
          # バリデーションOKの場合は保存
          if regulation_master.valid?
            regulation_master.save!
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
