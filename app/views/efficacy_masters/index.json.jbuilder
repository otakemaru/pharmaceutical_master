json.array!(@efficacy_masters) do |efficacy_master|
  json.extract! efficacy_master, :id, :code, :name
  json.url efficacy_master_url(efficacy_master, format: :json)
end
