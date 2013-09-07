class Query < ActiveRecord::Base
  
  attr_accessible :content, :url
  
  has_many :links, as: :parent
  
end
