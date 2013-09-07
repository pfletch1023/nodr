Nodr::Application.routes.draw do
  
  root :to => 'main#home'
  resources :graphs

  match "/admin" => "admin#hub"
  match "/login" => "sessions#new"
  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => :signout
  
  # Graphs controller routes  
  match "/new_graph" => "graphs#new"
  match "/new_node" => "graphs#new_node"
  match "/new_link" => "graphs#new_link"
  match "/new_query" => "graphs#new_query"
  match "/end_graph" => "graphs#end_graph"
  
end
