jQuery(document).ready(function(){
	/*****SIMPLE CHART*****/
	var tabApprenants = JSON.parse( jQuery("#tabChartApprenant").val() );
	var tabTuteurs = JSON.parse( jQuery("#tabChartTuteur").val() );
	var tabFormations = JSON.parse( jQuery("#tabChartFormation").val() );

	function showTooltip(x, y, contents) {
		jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
			position: 'absolute',
			display: 'none',
			top: y + 5,
			left: x + 5
		}).appendTo("body").fadeIn(200);
	}
	
	var plot = jQuery.plot(jQuery("#chartplace"),
			[ { data: tabApprenants, label: "Apprenants(x)", color: "#f9ac05"}, { data: tabTuteurs, label: "Tuteurs(x)", color: "#72f905"}, { data: tabFormations, label: "Formations(x)", color: "#0099FF"} ], {
					series: {
						lines: { show: true, fill: true, fillColor: { colors: [ { opacity: 0.05 }, { opacity: 0.15 } ] } },
						points: { show: true }
					},
					legend: { position: 'nw'},
					grid: { hoverable: true, clickable: true, borderColor: '#ccc', borderWidth: 1, labelMargin: 10 },
					yaxis: { min: 0, max: 15 }
			});
		
	var previousPoint = null;
	jQuery("#chartplace").bind("plothover", function (event, pos, item) {
		jQuery("#x").text(pos.x.toFixed(2));
		jQuery("#y").text(pos.y.toFixed(2));
		if(item) {
			if (previousPoint != item.dataIndex) {
				previousPoint = item.dataIndex;
						
				jQuery("#tooltip").remove();
				var x = item.datapoint[0].toFixed(2),
				y = item.datapoint[1].toFixed(2);
						
				showTooltip(item.pageX, item.pageY, item.series.label + " of " + x + " = " + y);
			}
		}
		else {
			jQuery("#tooltip").remove();
			previousPoint = null;            
		}
	});
		
	jQuery("#chartplace").bind("plotclick", function (event, pos, item) {
		if (item) {
			jQuery("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
			plot.highlight(item.series, item.datapoint);
		}
	});
});