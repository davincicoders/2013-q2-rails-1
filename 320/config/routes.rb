WebApp::Application.routes.draw do
  get  "/"                    => "real_estate#root"
  get  "/view_properties"     => "real_estate#view_properties", as: "properties"
  get  "/view_property/:id"   => "real_estate#view_property",   as: "property"
  get  "/admin_login"         => "admin#login",                 as: "login"
  post "/admin_login"         => "admin#login_post",            as: "login_post"
  get  "/edit_properties"     => "admin#edit_properties",       as: "edit_all"
  get  "/edit_property/:id"   => "admin#edit_property",         as: "edit_one"
  post "/edit_property/:id"   => "admin#edit_property_post",    as: "edit_post"
  get  "/add_new_property"    => "admin#add_new_property",      as: "add_new"
  post "/create_property"     => "admin#create_property",       as: "create"
  post "/delete_property/:id" => "admin#delete_property",       as: "delete"
  post "/logout"              => "admin#logout"
end
