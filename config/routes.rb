Nodr::Application.routes.draw do
  root :to => 'static_pages#home'

  match "/admin" => "admin#hub"
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  # Graphs controller routes  
  match "/new_graph" => "graphs#new_graph"
  match "/new_node" => "graphs#new_node"
  match "/new_link" => "graphs#new_link"
  match "/new_query" => "graphs#new_query"
  
end
