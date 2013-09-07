jQuery ->

	sigRoot = document.getElementById('sig')
	sigInst = sigma.init(sigRoot)
	sigInst.drawingProperties
		defaultLabelColor: '#fff',
		defaultLabelSize: 16,
		defaultLabelBGColor: '#fff',
		defaultLabelHoverColor: '#000',
		font: 'Century Gothic',
		defaultEdgeType: 'curve',
		nodeHoverColor: 'default',
		defaultNodeHoverColor: '#00ff00'
	sigInst.graphProperties
	  minNodeSize: 5,
	  maxNodeSize: 10

	$.ajax
		method: "GET",
		url: "http://localhost:3000/",
		dataType: "json",
		success: (data) ->
			graph = data["graph"]
			nodes = data["nodes"]
			edges = data["edges"]
			for node in nodes
				sigInst.addNode node.id,
					label: node.title,
					x: Math.random(),
					y: Math.random()
			for edge in edges
				sigInst.addEdge edge.parent_id + '-' + edge.node_id, edge.parent_id, edge.node_id
			sigInst.draw()