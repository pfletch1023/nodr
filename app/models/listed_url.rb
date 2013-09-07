class ListedUrl < ActiveRecord::Base
  
  BLACK = 0
  WHITE = 1
  
  attr_accessible :title, :url, :listed_type, :graph_id
  
  belongs_to :graph
  
end
