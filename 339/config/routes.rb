App::Application.routes.draw do
  get  "/"                      => "main#form",       as: "form"
  post "/upload"                => "main#upload",     as: "upload"
  get  "/images/:id.:extension" => "main#image_data", as: "image_data"
end
