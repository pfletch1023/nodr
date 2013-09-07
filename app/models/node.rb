class Node < ActiveRecord::Base
  
  attr_accessible :title, :url
  
  has_many :links_from, as: :parent, class_name: "Link"
  has_many :links_to, source: :child, class_name: "Link"
  
end
