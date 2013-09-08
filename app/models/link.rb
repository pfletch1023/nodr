class Link < ActiveRecord::Base
  
  attr_accessible :parent_id, :child_id, :graph_id, :link_type
  
  belongs_to :parent, foreign_key: :parent_id, class_name: "Node"
  belongs_to :child, foreign_key: :child_id, class_name: "Node"
  belongs_to :graph
  
  validates_presence_of :parent_id, :graph_id
  validates_uniqueness_of :parent_id, scope: [:child_id, :graph_id]

  after_create :create_weighted

  def create_weighted
    if self.child
    	exist = EdgeWeight.where(parent_id: self.parent.id, child_id: self.child.id).first
    	if exist
    		exist.value = exist.value + 0.5
    		exist.save
    	else
    		weight = EdgeWeight.new(parent_id: self.parent.id, child_id: self.child.id, value: 1 + self.relation_factor)
    		weight.save
    	end
    end
  end

  def relation_factor
  	p_results = AlchemyAPI::KeywordExtraction.new.search(url: self.parent.url)
  	c_results = AlchemyAPI::KeywordExtraction.new.search(url: self.child.url)
  	rf = 0
  	p_results.each do |pr|
  		c_results.each do |cr|
  			if pr["text"] == cr["text"]
  				rf += pr["relevance"].to_f + cr["relevance"].to_f
  			end
  		end
  	end
  	rf
  end
  
end
