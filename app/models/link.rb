class Link < ActiveRecord::Base
  
  attr_accessible :parent_id, :child_id, :graph_id
  
  belongs_to :parent, foreign_key: :parent_id, class_name: "Node"
  belongs_to :child, foreign_key: :child_id, class_name: "Node"
  belongs_to :graph
  
  validates_presence_of :parent_id, :graph_id
  validates_uniqueness_of :parent_id, scope: [:graph_id]
  
end
