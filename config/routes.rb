Nodr::Application.routes.draw do
  
  root :to => 'main#home'
  resources :graphs, :listed_urls

  match "/admin" => "admin#hub"
  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => :signout
  match "/user" => "sessions#user"
  match "/graphs" => "graphs#index"
  
  # Graphs controller routes  
  match "/new_graph" => "graphs#new"
  match "/new_node" => "graphs#new_node"
  match "/new_link" => "graphs#new_link"
  match "/new_query" => "graphs#new_query"
  match "/end_graph" => "graphs#end_graph"
  match "/recommendations" => "graphs#node_recommendations"
  match "/graphs/:id/listed_urls/new" => "listed_urls#new", as: "new_listed_url"
  match "/last_graph" => "graphs#last_graph"
  
end
