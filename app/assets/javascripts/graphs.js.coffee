jQuery ->

	sigRoot = document.getElementById('sig')
	sigInst = sigma.init(sigRoot)
	sigInst.drawingProperties
	  defaultLabelColor: '#fff',
	    defaultLabelSize: 14,
	    defaultLabelBGColor: '#fff',
	    defaultLabelHoverColor: '#000',
	    labelThreshold: 6,
	    defaultEdgeType: 'curve'
	sigInst.graphProperties
	  minNodeSize: 5,
	  maxNodeSize: 10
	sigInst.addNode 'hello',
		label: 'Hello',
		x: Math.random(),
		y: Math.random()
	sigInst.addNode 'world',
		label: 'World!',
		x: Math.random(),
  		y: Math.random()
	sigInst.addEdge 'hello_world', 'hello', 'world'
	sigInst.draw()