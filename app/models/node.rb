class Node < ActiveRecord::Base
  
  # Constants
  WEBSITE = 0
  QUERY = 1
  
  attr_accessible :title, :url
  
  has_many :links_from, source: :parent, class_name: "Link"
  has_many :links_to, source: :child, class_name: "Link"
  
  validates_presence_of :title, :url
  
end
