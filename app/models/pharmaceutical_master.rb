class PharmaceuticalMaster < ActiveRecord::Base
  self.primary_key = "a"

  def self.integrate
    PharmaceuticalMaster.transaction do
      delete_all
      imported_num = 0

      pharmaceuticals_list = []
      # LEFT OUTER JOINするため、eager_loadを使用
      pharmaceuticals_masters = HotMaster.eager_load(:price_master, :gs1_master)

      pharmaceuticals_masters.each do |pharmaceutical_master|
        pharmaceutical = PharmaceuticalMaster.new
        pharmaceutical.attributes= {
          a: pharmaceutical_master.a,
          b: pharmaceutical_master.f,
          c: pharmaceutical_master.g,
          d: pharmaceutical_master.i,
          e: pharmaceutical_master.ab,
          f: pharmaceutical_master.ag,
          aa: pharmaceutical_master.ba,
          ab: pharmaceutical_master.bb
        }

        if pharmaceutical_master.price_master.present?
          regulation_id = pharmaceutical_master.price_master.ad
          efficacy_id = pharmaceutical_master.g[0, 3]
          pharmaceutical.attributes= {
            g: pharmaceutical_master.price_master.ab,
            h: regulation_id,
            i: RegulationMaster.find(regulation_id).name,
            j: pharmaceutical_master.price_master.ag,
            ac: efficacy_id,
            ad: EfficacyMaster.find(efficacy_id).name
          }
        end

        if pharmaceutical_master.gs1_master.present?
          pharmaceutical.attributes= {
            ae: pharmaceutical_master.gs1_master.bj,
            af: pharmaceutical_master.gs1_master.cc,
            ag: pharmaceutical_master.gs1_master.cd
          }
        end

        pharmaceuticals_list << pharmaceutical
        imported_num += 1
      end
      PharmaceuticalMaster.import pharmaceuticals_list

      # 更新件数を返却
      imported_num
    end
  rescue => e
    p  e.message
  end

  def self.to_csv
    headers = %w(基準番号（ＨＯＴコード） ＪＡＮコード 薬価基準収載医薬品コード レセプト電算処理システムコード（１） 販売名 包装単位単位 新又は現金額 麻薬・毒薬・覚せい剤原料・向精神薬 規制分類名 後発品 製造会社 販売会社 薬効コード 薬効分類名 調剤包装単位コード 販売包装単位コード 元梱包装単位コード)
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      all.each do |row|
        # csv << row.attributes.values_at(*self.column_names)
        csv << row.attributes.values_at("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "aa", "ab", "ac", "ad", "ae", "af", "ag")
      end
    end
    csv_data.encode(Encoding::UTF_8)
  end
end