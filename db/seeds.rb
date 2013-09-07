# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

n_n = 20
n_l = 50

g = FactoryGirl.create(:graph)
ns = FactoryGirl.create_list(:node, n_n)
n_l.times do
	parent = rand(n_n)
	child = rand(n_n)
	while child == parent || g.links.where(parent_id: ns[parent].id, node_id: ns[child].id).count > 0
		child = rand(n_n)
		parent = rand(n_n)
	end
	FactoryGirl.create(:link, graph: g, parent: ns[parent], child: ns[child])
end