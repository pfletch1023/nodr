# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Graph.all.each { |x| x.destroy }
Link.all.each { |x| x.destroy }
Node.all.each { |x| x.destroy }

def babies(g, s, r)
	nodes = FactoryGirl.create_list(:node, rand(r))
	nodes.each do |node|
		FactoryGirl.create(:link, graph: g, parent: s, child: node, link_type: rand(2))
		babies(g, node, r - 1)
	end
end

graph = FactoryGirl.create(:graph)
start = FactoryGirl.create(:node)

random = 6

babies(graph, start, random)