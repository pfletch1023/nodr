jQuery ->

	sigInst = sigma.init(document.getElementById('sig'))

	drawGraph = ->
		$.ajax
			method: "GET",
			url: window.location.pathname,
			dataType: "json",
			success: (data) ->
				mainColor = Math.floor(Math.random() * 360)

				sigma.publicPrototype.degreeToSize = ->
					biggest = 0
					this.iterNodes (node) ->
						node.size = node.degree
						if node.degree > biggest
							biggest = node.degree
					this.iterNodes (node) ->
						node.color = tinycolor("hsv(" + mainColor + ", " + (Math.floor(100 * node.degree / biggest)) + "%, " + (Math.floor(100 * node.degree / biggest)) + "%)").toHex()
					this.drawingProperties
						labelThreshold: biggest * 2

				sigInst = sigma.init(document.getElementById('sig'))

				sigInst.drawingProperties
					defaultLabelColor: '#fff',
					defaultLabelSize: 16,
					defaultLabelBGColor: '#fff',
					defaultLabelHoverColor: '#000',
					font: 'Century Gothic',
					defaultEdgeType: 'curve'
				sigInst.graphProperties
					minNodeSize: 1,
					maxNodeSize: 10
				sigInst.mouseProperties
					mouseEnabled: false

				greyColor = "#444"
				sigInst.bind('overnodes', (event) ->
					ns = event.content
					neighbors = {}
					sigInst.iterEdges (e) ->
						if ns.indexOf(e.source) < 0 && ns.indexOf(e.target) < 0
							if not e.attr['grey']
								e.attr['true_color'] = e.color
								e.color = greyColor
								e.attr['grey'] = 1
						else
							e.color = if e.attr['grey'] then e.attr['true_color'] else e.color
							e.attr['grey'] = 0
							neighbors[e.source] = 1
							neighbors[e.target] = 1
					sigInst.iterNodes (n) ->
						if not neighbors[n.id]
							if not n.attr['grey']
								n.attr['true_color'] = n.color
								n.color = greyColor
								n.attr['grey'] = 1
								n.forceLabel = false
						else
							n.color = if n.attr['grey'] then n.attr['true_color'] else n.color
							n.attr['grey'] = 0
							n.forceLabel = true
					sigInst.draw(2, 2, 2)
				).bind('outnodes', ->
					sigInst.iterEdges (e) ->
						e.color = if e.attr['grey'] then e.attr['true_color'] else e.color
						e.attr['grey'] = 0
					sigInst.iterNodes (n) ->
						n.color = if n.attr['grey'] then n.attr['true_color'] else n.color
						n.attr['grey'] = 0
						n.forceLabel = false
					sigInst.draw(2,2,2)
				).bind 'downnodes', (event) ->
					ns = event.content
					sigInst.iterNodes (n) ->
						if ns.indexOf(n.id) >= 0
							window.open(n.attr['url'],'_blank');

				graph = data["graph"]
				nodes = data["nodes"]
				edges = data["edges"]
				for node in nodes
					sigInst.addNode node.id,
						label: node.title,
						x: Math.random() * 2 - 1,
						y: Math.random() * 0.8,
						url: node.url
				for edge in edges
					sigInst.addEdge edge.parent_id + '-' + edge.child_id, edge.parent_id, edge.child_id,
						size: 2
				sigInst.degreeToSize()
				sigInst.activateFishEye().draw()

	drawGraph()

	$(window).resize ->
		# sigInst.iterEdges (e) ->
		# 	sigInst.dropEdge(e)
		# sigInst.iterNodes (n) ->
		# 	sigInst.dropNode(n)
		# # $("#sig").empty()
		# # drawGraph()