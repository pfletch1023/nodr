class Link < ActiveRecord::Base
  
  attr_accessible :parent_id, :parent_type, :node_id, :session_id
  
  belongs_to :parent, polymorphic: true # Can be node or query
  belongs_to :child, foreign_key: :node_id, class_name: "Node"
  belongs_to :session
  
end
