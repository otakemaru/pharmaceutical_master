json.array!(@hot_masters) do |hot_master|
  json.extract! hot_master, :id, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd
  json.url hot_master_url(hot_master, format: :json)
end
