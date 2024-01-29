json.extract! card, :id, :weight, :color, :description, :created_at, :updated_at
json.url card_url(card, format: :json)
