class ListedUrlsController < ApplicationController
  
  def new
    @graph = Graph.find(params[:id])
    @listed_url = ListedUrl.new
  end
  
  def create
    @listed_url = ListedUrl.new(params[:listed_url])
    if @listed_url.save
      redirect_to @listed_url.graph
    else
      render :new
    end
  end
  
end
