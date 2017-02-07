json.extract! conference, :id, :title, :location, :description, :url, :start_date, :end_date, :created_at, :updated_at
json.url conference_url(conference, format: :json)