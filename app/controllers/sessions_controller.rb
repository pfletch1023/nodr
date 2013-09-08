class SessionsController < ApplicationController
  
	def new
	  nodes = Node.all.sort { |a,b| a.created_at <=> b.created_at }
	  edges = Link.all

       respond_to do |format|
         format.html
         format.json { render json: { nodes: nodes, edges: edges } }
       end
	end
  
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		source = session[:source] || :root
		session[:source] = nil
		redirect_to source, :notice => "Signed in!"
	end

	def destroy
		reset_session
		redirect_to :root, :notice => "Signed out!"
	end
	
	def user
	  if current_user
	    render json: current_user
	  else
	    render json: {error: "Not logged in"}, status: :unauthorized
	  end
	end
	
end
