class Node < ActiveRecord::Base
  
  # Constants
  WEBSITE = 0
  QUERY = 1
  
  attr_accessible :title, :url
  
  has_many :links_from, foreign_key: :parent_id, class_name: "Link"
  has_many :links_to, foreign_key: :child_id, class_name: "Link"
  
  validates_presence_of :title, :url
  
end
