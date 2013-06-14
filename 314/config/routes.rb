App::Application.routes.draw do
  get "/"         => "table#choose_table"
  get "/table/:table_id" => "table#show_table"
  post "/table/:table_id" => "table#place_order"
end