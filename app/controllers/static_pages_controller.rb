class StaticPagesController < ApplicationController
	def home
		graph = User.last.current_graph
		nodes = graph.nodes
		edges = graph.links

		respond_to do |format|
			format.html
			format.json { render json: { graph: graph, nodes: nodes, edges: edges } }
		end
	end
end
