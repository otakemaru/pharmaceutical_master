require 'csv'
class EfficacyMaster < ActiveRecord::Base
  self.primary_key = "code"

  def self.input(file)
    EfficacyMaster.transaction do
      delete_all
      imported_num = 0
      efficacy_master_list = []
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
          efficacy_master = find_by(:code => table["code"])
          if efficacy_master.nil?
            efficacy_master = new
          end

          # 情報更新
          efficacy_master.attributes = table.to_hash.slice(
              *table.to_hash.except(:code, :name, :created_at, :updated_at).keys)
          # バリデーションOKの場合は保存
          if efficacy_master.valid?
            efficacy_master_list << efficacy_master
            imported_num += 1
          end
        end
      end
      EfficacyMaster.import efficacy_master_list
      # 更新件数を返却
      imported_num
    end
  rescue => e
    p  e.message
  end

end
