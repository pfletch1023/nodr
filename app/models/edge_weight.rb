class EdgeWeight < ActiveRecord::Base
  
  attr_accessible :parent_id, :child_id, :value
  
  belongs_to :parent, foreign_key: :parent_id, class_name: "Node"
  belongs_to :child, foreign_key: :child_id, class_name: "Node"
  
end
