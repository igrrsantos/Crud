json.extract! pessoa, :id, :name, :birth_date, :status, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
