class Link < ActiveRecord::Base
  
  SOFT = 0.4
  HARD = 1.0
  
  attr_accessible :parent_id, :child_id, :graph_id, :list_type
  
  belongs_to :parent, foreign_key: :parent_id, class_name: "Node"
  belongs_to :child, foreign_key: :child_id, class_name: "Node"
  belongs_to :graph
  
  validates_presence_of :parent_id, :graph_id
  validates_uniqueness_of :parent_id, scope: [:child_id, :graph_id]
  
end
