class GraphsController < ApplicationController
  
  before_filter :authenticated
  respond_to :html, :json
  
  def new_graph
    graph = Graph.new(user_id: current_user.id)
    respond_with graph
  end
  
  def new_node
    node = Node.new(params)
  end
  
  def new_link
  
  end
  
  def new_query
    
  end
  
end
