class PharmaceuticalMaster < ActiveRecord::Base
  self.primary_key = "a"

  def self.integrate
    PharmaceuticalMaster.transaction do
      delete_all
      imported_num = 0
      pharmaceuticals_masters_list = []
      pharmaceuticals_masters = HotMaster.joins(:price_master, :gs1_master)
      pharmaceuticals_masters.each do |pharmaceutical_master|
        regulation_id = pharmaceutical_master.price_master.ad
        efficacy_id = pharmaceutical_master.g[0, 3]
        pharmaceuticals_masters_list << PharmaceuticalMaster.new(
          a: pharmaceutical_master.a,
          b: pharmaceutical_master.f,
          c: pharmaceutical_master.g,
          d: pharmaceutical_master.i,
          e: pharmaceutical_master.ab,
          f: pharmaceutical_master.ag,
          g: pharmaceutical_master.ba,
          h: pharmaceutical_master.bb,
          i: pharmaceutical_master.price_master.ab,
          j: regulation_id,
          aa: RegulationMaster.find(regulation_id).name,
          ab: pharmaceutical_master.price_master.ag,
          ac: efficacy_id,
          ad: EfficacyMaster.find(efficacy_id).name,
          ae: pharmaceutical_master.gs1_master.bj,
          af: pharmaceutical_master.gs1_master.cc,
          ag: pharmaceutical_master.gs1_master.cd
        )
        imported_num += 1
      end
      # 更新件数を返却
      PharmaceuticalMaster.import pharmaceuticals_masters_list
      imported_num
    end
  rescue => e
  p  e.message
  end

  def self.to_csv
    headers = %w(基準番号（ＨＯＴコード） ＪＡＮコード 薬価基準収載医薬品コード レセプト電算処理システムコード（１） 販売名 包装単位単位 製造会社 販売会社 新又は現金額 麻薬・毒薬・覚せい剤原料・向精神薬 規制分類名 後発品 薬効コード 薬効分類名 調剤包装単位コード 販売包装単位コード 元梱包装単位コード)
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      all.each do |row|
        # csv << row.attributes.values_at(*self.column_names)
        csv << row.attributes.values_at("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "aa", "ab", "ac", "ad", "ae", "af", "ag")
      end
    end
    csv_data.encode(Encoding::UTF_8)
  end

end