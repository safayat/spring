<%--
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer",
	{
		theme: "theme2",
		title:{
			text: "Gaming Consoles Sold in 2012"
		},
		legend:{
			verticalAlign: "bottom",
			horizontalAlign: "center"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y} - #percent %",
			yValueFormatString: "#0.#,,. Million",
			dataPoints: [
				{  y: 50, legendText:"PS 3", indexLabel: "PlayStation 3" },
				{  y: 30, legendText:"Wii", indexLabel: "Wii" },
				{  y: 15, legendText:"360", indexLabel: "Xbox 360" },
				{  y: 35, legendText:"DS" , indexLabel: "Nintendo DS"},
				{  y: 40, legendText:"PSP", indexLabel: "PSP" },
				{  y: 34, legendText:"3DS" , indexLabel: "Nintendo 3DS"},
				{  y: 11, legendText:"Vita" , indexLabel: "PS Vita"}
			]
		}
		]
	});
	chart.render();
}
</script>
<script type="text/javascript" src="/assets/script/canvasjs.min.js"></script></head>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
</body>
 </html>

--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<script src="${appBaseUrl}/js/neuboard/pieChart.js"></script>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Dashboard</h1>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div id="chartContainer" style="height: 300px; width: 100%;"></div>
            </section>
        </section>
        <script type="text/javascript">
            var app = angular.module('myApp', []);

            angular.element(document).ready(function () {
                var chart = new CanvasJS.Chart("chartContainer",
                        {
                            theme: "theme2",
                            title:{
                                text: "Gaming Consoles Sold in 2012"
                            },
                            legend:{
                                verticalAlign: "bottom",
                                horizontalAlign: "center"
                            },
                            data: [
                                {
                                    type: "pie",
                                    showInLegend: true,
                                    toolTipContent: "{y} - #percent %",
                                    yValueFormatString: "#0.#,,. Million",
                                    dataPoints: [
                                        {  y: 50, legendText:"PS 3", indexLabel: "PlayStation 3" },
                                        {  y: 30, legendText:"Wii", indexLabel: "Wii" },
                                        {  y: 15, legendText:"360", indexLabel: "Xbox 360" },
                                        {  y: 35, legendText:"DS" , indexLabel: "Nintendo DS"},
                                        {  y: 40, legendText:"PSP", indexLabel: "PSP" },
                                        {  y: 34, legendText:"3DS" , indexLabel: "Nintendo 3DS"},
                                        {  y: 11, legendText:"Vita" , indexLabel: "PS Vita"}
                                    ]
                                }
                            ]
                        });
                chart.render();

             });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

