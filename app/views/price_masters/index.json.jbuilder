json.array!(@price_masters) do |price_master|
  json.extract! price_master, :id, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce
  json.url price_master_url(price_master, format: :json)
end
