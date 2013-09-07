Nodr::Application.routes.draw do
  root :to => 'static_pages#home'

  match "/admin" => "admin#hub"
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  # Graphs controller routes  
  match "/new_graph" => "graphs#new_graph", via: :post
  match "/new_node" => "graphs#new_node", via: :post
  match "/new_link" => "graphs#new_link", via: :post
  match "/new_query" => "graphs#new_query", via: :post
  
end
