json.extract! todo, :id, :title, :body, :done, :priority, :created_at, :updated_at
json.url todo_url(todo, format: :json)
