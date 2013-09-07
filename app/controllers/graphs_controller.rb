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
    
    # Create null link
    null_link = Link.create(node_id: node.id, graph_id: current_user.current_graph.id)
    respond_with node
  end
  
  def new_link
    # Find or create parent
    parent_url = clean_url(params[:parent][:url])
    parent = Node.find_or_create_by_url(parent_url)
    
    # Find or create child
    child_url = clean_url(params[:child][:url])
    child = Node.find_or_create_by_url(child_url)
    
    # Create link between parent and child
    link = Link.new(node_id: child.id, graph_id: current_user.current_graph.id)
    link.parent = parent
    if link.save
      respond_with link
    end
  end
  
  def new_query
    
  end
  
end
