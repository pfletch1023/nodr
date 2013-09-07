class MainController < ApplicationController
  
  before_filter :authenticated
  
	def home
	  @graphs = current_user.graphs
	  @current_graph = current_user.current_graph
	end
	
end
