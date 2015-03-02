json.array!(@identities) do |identity|
  json.extract! identity, :id, :name, :enrollment, :campus, :picture_url, :pdf_url, :last_print, :user_id
  json.url identity_url(identity, format: :json)
end
