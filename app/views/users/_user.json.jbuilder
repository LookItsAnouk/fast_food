json.extract! user, :id, :first_name, :last_name, :email, :password_digest, :address, :phone, :is_cook, :created_at, :updated_at
json.url user_url(user, format: :json)
