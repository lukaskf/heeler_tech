json.extract! workorder, :id, :time, :duration, :price, :created_at, :updated_at
json.url workorder_url(workorder, format: :json)
