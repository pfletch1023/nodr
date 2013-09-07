class GraphsController < ApplicationController
  
  before_filter :authenticated
  before_filter :check_current_graph, except: ["new_graph"]
  
  def check_current_graph
    unless current_user.current_graph
      respond_to do |format|
        format.html { return redirect_to :root }
        format.json { return render json: { error: "No current graph exists" }, status: :forbidden }
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
    # Validate url
    unless current_user.current_graph.valid_url?(params[:url])
      respond_to do |format|
        format.html { return redirect_to :root }
        format.json { return render json: { error: "URL is blacklisted" }, status: :forbidden }
      end
    else
      # Find or create node
      node = Node.where(url: params[:url]).first
      unless node
        node = Node.new(title: params[:title], url: params[:url])
      end
      
      if node.save
        # Create null link
        null_link = Link.new(graph_id: current_user.current_graph.id)
        null_link.parent = node
        respond_to do |format|
          format.html { redirect_to :root }
          if null_link.save
            format.json { render json: node }
          else
            format.json { render json: null_link.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to :root }
          format.json { render json: node.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def new_link
    # Validate url
    unless params[:child] && current_user.current_graph.valid_url?(params[:child][:url])
      respond_to do |format|
        format.html { return redirect_to :root }
        format.json { return render json: { error: "URL is blacklisted" }, status: :forbidden }
      end
    else
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
  
end
