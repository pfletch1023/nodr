class Node < ActiveRecord::Base
  
  # Constants
  WEBSITE = 0
  QUERY = 1
  
  attr_accessible :title, :url
  
  # Links
  has_many :links_from, foreign_key: :parent_id, class_name: "Link"
  has_many :links_to, foreign_key: :child_id, class_name: "Link"
  
  # Edge Weights
  has_many :weights_from, foreign_key: :parent_id, class_name: "EdgeWeight"
  has_many :weights_to, foreign_key: :child_id, class_name: "EdgeWeight"
  
  validates_presence_of :title, :url
  
  def self.get_node(url = nil, title = nil)
    node = Node.where(url: url).first
    unless node
      node = Node.new(title: title, url: url)
      if !node.save
        return false
      end
    end
    return node
  end
  
  def get_recommendations
    recs = EdgeWeight.where(parent_id: self.id).order("value DESC")
    recs.map! { |rec| { url: rec.child.url, title: rec.child.title } }
  end
end
