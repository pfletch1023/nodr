class GraphsController < ApplicationController
  
  before_filter :authenticated
  respond_to :html, :json
  
  def new_graph
    graph = Graph.create(user_id: current_user.id)
    respond_with graph
  end
  
  def new_node
    node = Node.create(
      title: params[:title],
      url: params[:url]
    )
    respond_with node
  end
  
  def new_link
    # Find or create parent
    parent_url = clean_url(params[:parent][:url])
    parent = Node.find_or_create_by_url(parent_url)
    
    # Find or create child
    child_url = clean_url(params[:child][:url])
    child = Node.find_or_create_by_url(child_url)
    
    #
    # attr_accessible :parent_id, :parent_type, :node_id, :session_id
  end
  
  def new_query
    
  end
  
end
