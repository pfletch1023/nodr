jQuery ->
	$("#logo").hover ->
		$("#logo").animate { height: "4em", top: 0 },
			duration: 200,
			easing: 'easeInBack'
		$("#logo p").animate { marginTop: "0.3em" },
			duration: 200,
			easing: 'easeInBack'
	,
	->
		$("#logo").animate { height: "3em", top: "1em" },
			duration: 200,
			easing: 'easeOutBack'
		$("#logo p").animate { marginTop: "0.2em" },
			duration: 200,
			easing: 'easeOutBack'