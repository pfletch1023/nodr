$(document).ready(function () {

	$("body").css({
		overflow: "hidden"
	});
	//$("body").queryLoader2({onComplete: function() {
		$("<div id='circleWindow'><div id='circleReveal'></div></div>").appendTo($("body"));
		$("#logo").css({marginTop: "-" + $("#logo").height() / 2 + "px"});
		$("nav").css({marginTop: "-"  + $("nav").height() + "px"});
		$("#circleWindow").css({
			position: "absolute",
			width: "100%",
			height: "100%",
			overflow: "hidden",
			zIndex: "666999"
		});
		$("#circleReveal").css({
			width: "0px",
			height: "0px",
			overflow: "hidden",
			position: "absolute",
			border: "2000px solid white",
			"border-radius": "10000px"
		});
		$("#circleReveal").css({
			top: $(window).height() / 2 - $("#circleReveal").outerHeight() / 2 + "px",
			left: $(window).width() / 2 - $("#circleReveal").outerWidth() / 2 + "px"
		});
		var finalRadius = Math.ceil(Math.sqrt(Math.pow($(window).width(), 2) + Math.pow($(window).height(), 2)));
		$("nav").delay(700).animate({marginTop: 0}, 500);
		$("#circleReveal").delay(200).animate({
			width: finalRadius + "px",
			height: finalRadius + "px"
		}, {
			duration: 800,
			step: function() {
				$("#circleReveal").css({
					top: $(window).height() / 2 - $("#circleReveal").outerHeight() / 2 + "px",
					left: $(window).width() / 2 - $("#circleReveal").outerWidth() / 2 + "px"
				});
			},
			complete: function() {
				$("#circleWindow").remove();
				$(window).resize(function() {
					$("#logo").css({marginTop: "-" + $("#logo").height() / 2 + "px"});
				});
				$("body").css({
					overflow: "visible"
				});
			}
		});
		function changeBg(pos) {
			return function() {
				for(var i = 0; i < $("nav li a").length; i++) {
					if(i != pos) {
						$(".hoverBar:eq(" + i + ")").css({height: "0px"});
						$("nav li a:eq(" + i + ")").css({color: "#231f20"}).on('mouseover', overButton(i)).on('mouseout', outButton(i));
					}
					else {
						$(".hoverBar:eq(" + i + ")").css({height: "5px"});
						$("nav li a:eq(" + i + ")").css({color: buttonColors[pos]}).off('mouseover').off('mouseout');
					}
				}
				$("#bg").css({"background-color": bgColors[pos]});
			}
		}
		function overButton(pos) {
			return function() {
				$(this).css({"color": buttonColors[pos]});
				$(".hoverBar:eq(" + pos + ")").css({height: "5px"});
			}
		}
		function outButton(pos) {
			return function() {
				$(this).css({"color": "#231f20"});
				$(".hoverBar:eq(" + pos + ")").css({height: "0px"});
			}
		}
		var bgColors = ["#33ddff", "#33ff77", "#8066ff", "#ff4c6a", "#ffff33"];
		var buttonColors = ["#4cc3ff", "#45e57a", "#8066ff", "#ff4c6a", "#e5e52e"];
		for(var i = 0; i < $("nav li a").length; i++) {
			$(".hoverBar:eq("+ i + ")").css({"background-color": buttonColors[i]});
			$("nav li a:eq(" + i + ")").click(changeBg(i)).mouseover(overButton(i)).mouseout(outButton(i));
		}
	//}});
	
});