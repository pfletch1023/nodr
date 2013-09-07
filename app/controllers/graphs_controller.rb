class GraphsController < ApplicationController
  
  before_filter :authenticated
  before_filter :check_current_graph, except: ["new_graph"]
  
  def check_current_graph
    unless current_user.current_graph
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: { error: "No current graph exists" }, status: :forbidden }
      end
    end
  end
  
  def validate_url(url)
    unless current_user.current_graph.valid_url?(url)
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: { error: "URL is blacklisted" }, status: :forbidden }
      end
    end
  end
  
  def new
    unless current_user.current_graph
      graph = Graph.create(user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: graph }
      end
    else
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: { error: "Current graph already exists" }, status: :forbidden }
      end
    end
  end
  
  def show
    @graph = Graph.find(params[:id])

    graph = current_user.current_graph
    nodes = graph.nodes
    edges = graph.links

    respond_to do |format|
      format.html
      format.json { render json: { graph: graph, nodes: nodes, edges: edges } }
    end
  end
  
  def end_graph
    graph = current_user.current_graph
    graph.end_at = DateTime.now()
    if graph.save
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: graph }
      end
    end
  end
  
  def new_node
    # Find or create node
    node = Node.where(url: params[:url]).first
    unless node
      node = Node.create(title: params[:title], url: params[:url])
    end
    
    # Create null link
    null_link = Link.new(graph_id: current_user.current_graph.id)
    null_link.parent = node
    if null_link.save
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: node }
      end
    end
  end
  
  def new_link
    # Find or create parent
    parent_url = clean_url(params[:parent][:url])
    parent = Node.find_or_create_by_url(parent_url)
    
    # Find or create child
    child_url = clean_url(params[:child][:url])
    child = Node.find_or_create_by_url(child_url)
    
    # Create link between parent and child
    link = Link.new(child_id: child.id, graph_id: current_user.current_graph.id)
    link.parent = parent
    if link.save
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: link }
      end
    end
  end
  
end
