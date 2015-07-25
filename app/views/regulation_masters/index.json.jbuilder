json.array!(@regulation_masters) do |regulation_master|
  json.extract! regulation_master, :id, :code, :name
  json.url regulation_master_url(regulation_master, format: :json)
end
