json.extract! profile, :id, :full_name, :title, :bio, :country, :cost, :picture_url, :created_at, :updated_at
json.url profile_url(profile, format: :json)
