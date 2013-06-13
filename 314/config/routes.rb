App::Application.routes.draw do
  get "/" => "main#root"
  get "/table/:table_id" => "main#table"
  post "/table/:table_id" => "main#table_post"
end
