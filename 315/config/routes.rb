App::Application.routes.draw do
  get  "/"                => "main#choose_table"
  get  "/table/:table_id" => "main#show_table"
  post "/table/:table_id" => "main#show_table_post"
end
