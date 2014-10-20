json.array!(@honyakus) do |honyaku|
  json.extract! honyaku, :id, :question_body, :name
  json.url honyaku_url(honyaku, format: :json)
end
