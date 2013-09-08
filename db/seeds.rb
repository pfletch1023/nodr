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
EdgeWeight.all.each { |x| x.destroy }

# def babies(g, s, r)
# 	nodes = FactoryGirl.create_list(:node, rand(r))
# 	nodes.each do |node|
# 		FactoryGirl.create(:link, graph: g, parent: s, child: node, link_type: rand(2))
# 		babies(g, node, r - 1)
# 	end
# end

# graph = FactoryGirl.create(:graph)
# start = FactoryGirl.create(:node)

# random = 6

# babies(graph, start, random)

# g = FactoryGirl.create(:graph)
# a = FactoryGirl.create(:node, url: "http://en.wikipedia.org/wiki/Bubble_tea")
# b = FactoryGirl.create(:node, url: "http://travel.cnn.com/explorations/drink/inventor-bubble-tea-885732")
# c = FactoryGirl.create(:node, url: "http://www.huffingtonpost.com/2013/09/07/1-percent-tea-party_n_3887348.html?utm_hp_ref=politics")
# FactoryGirl.create(:link, parent: a, child: b, graph: g, link_type: 0)
# FactoryGirl.create(:link, parent: a, child: c, graph: g, link_type: 1)