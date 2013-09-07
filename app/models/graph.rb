class Graph < ActiveRecord::Base
  
  attr_accessible :name, :description, :user_id
  
  belongs_to :user
  has_many :links
  has_many :listed_urls
  has_many :child_nodes, through: :links, source: :child
  has_many :parent_nodes, through: :links, source: :parent
  
  def nodes
    (child_nodes + parent_nodes).uniq
  end
  
  def valid_url?(url)
    listed_urls.where(listed_type: 0).each do |listed|
      if listed.url == url
        return false
      end
    end
    return true
  end
  
end
