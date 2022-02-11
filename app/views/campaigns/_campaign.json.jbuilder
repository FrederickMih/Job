json.extract! campaign, :id, :name, :caller_number, :start_date, :status, :user_id, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
