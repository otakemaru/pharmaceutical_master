json.array!(@gs1_masters) do |gs1_master|
  json.extract! gs1_master, :id, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :aa, :ab, :ac, :ad, :ae, :af, :ag, :ah, :ai, :aj, :ba, :bb, :bc, :bd, :be, :bf, :bg, :bh, :bi, :bj, :ca, :cb, :cc, :cd, :ce, :cf, :cg, :ch, :ci, :cj, :da, :db, :dc, :dd
  json.url gs1_master_url(gs1_master, format: :json)
end
