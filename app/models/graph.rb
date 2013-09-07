class Graph < ActiveRecord::Base
  
  attr_accessible :name, :description, :user_id
  
  belongs_to :user
  has_many :links
  has_many :child_nodes, through: :links, source: :child
  has_many :parent_nodes, through: :links, source: :parent
  
  def nodes
    (child_nodes + parent_nodes).uniq
  end
  
end
