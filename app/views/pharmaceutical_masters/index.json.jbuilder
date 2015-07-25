json.array!(@pharmaceutical_masters) do |pharmaceutical_master|
  json.extract! pharmaceutical_master, :id, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag
  json.url pharmaceutical_master_url(pharmaceutical_master, format: :json)
end
