json.extract! dato, :id, :nombre, :apellido, :email, :edad, :created_at, :updated_at
json.url dato_url(dato, format: :json)
