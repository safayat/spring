
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<script src="${appBaseUrl}/js/neuboard/pieChart.js"></script>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Dashboard</h1>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div class="row">
                    <div class="col-md-12">

                        <div class="panel panel-default" style="min-height: 0px">
                            <div class="panel-heading">
                                <h3 class="panel-title">Member Statistics</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-sm-6">
                                    <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="chartContainer_bar" style="height: 300px; width: 100%;"></div>
                                </div>

                            </div>
                        </div>

                        <div class="panel panel-default" style="min-height: 0px">
                            <div class="panel-heading">
                                <h3 class="panel-title">Result Statistics</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-sm-6">
                                    <div id="chartContainer3" style="height: 300px; width: 100%;"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="chartContainer4" style="height: 300px; width: 100%;"></div>
                                </div>

                            </div>
                        </div>

                        <div class="panel panel-default" style="min-height: 0px">
                            <div class="panel-heading">
                                <h3 class="panel-title">Newly Admitted Students</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Roll</th>
                                            <th>Class</th>
                                            <th>Previous School</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Ajit mitra</td>
                                            <td>67</td>
                                            <td>Class4</td>
                                            <td>Kakoli High School,Dhaka</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Rakib Khan</td>
                                            <td>66</td>
                                            <td>Class4</td>
                                            <td>-</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Oishi Ahmed</td>
                                            <td>69</td>
                                            <td>Class7</td>
                                            <td>Mirzapur Girls School,Dhaka</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
        <script type="text/javascript">
            var app = angular.module('myApp', []);

            angular.element(document).ready(function () {
                var chart = new CanvasJS.Chart("chartContainer",
                        {
                            theme: "theme2",
                            title:{
                                text: "School Members"
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
                                    yValueFormatString: "#0.#",
                                    dataPoints: [
                                        {  y: 50, legendText:"T", indexLabel: "Teachers" },
                                        {  y: 500, legendText:"St", indexLabel: "Students" },
                                        {  y: 70, legendText:"Sta", indexLabel: "Staff" },
                                        {  y: 10, legendText:"Board" , indexLabel: "Board members"}
                                    ]
                                }
                            ]
                        });
                chart.render();

                var chartBar = new CanvasJS.Chart("chartContainer_bar", {
                    theme: "theme2",//theme1
                    title:{
                        text: "Student Number Growth"
                    },
                    animationEnabled: false,   // change to true
                    data: [
                        {
                            // Change type to "bar", "splineArea", "area", "spline", "pie",etc.
                            type: "column",
                            dataPoints: [
                                { label: "2014",  y: 500  },
                                { label: "2013", y: 478  },
                                { label: "2012", y: 543  },
                                { label: "2011",  y: 350  },
                                { label: "2010",  y: 345  }
                            ]
                        }
                    ]
                });
                chartBar.render();

                var chartBar3 = new CanvasJS.Chart("chartContainer3", {
                    theme: "theme2",//theme1
                    title:{
                        text: "SSC CGPA5 Percentages "
                    },
                    animationEnabled: false,   // change to true
                    data: [
                        {
                            // Change type to "bar", "splineArea", "area", "spline", "pie",etc.
                            type: "column",
                            dataPoints: [
                                { label: "2014",  y: 95  },
                                { label: "2013", y: 80  },
                                { label: "2012", y: 70  },
                                { label: "2011",  y: 50  },
                                { label: "2010",  y: 45  }
                            ]
                        }
                    ]
                });
                chartBar3.render();

                var chartBar4 = new CanvasJS.Chart("chartContainer4", {
                    theme: "theme2",//theme1
                    title:{
                        text: "2014 Final Exam Pass Statistics(%) "
                    },
                    animationEnabled: false,   // change to true
                    data: [
                        {
                            // Change type to "bar", "splineArea", "area", "spline", "pie",etc.
                            type: "column",
                            dataPoints: [
                                { label: "Class1",  y: 95  },
                                { label: "Class2", y: 80  },
                                { label: "Class3", y: 98  },
                                { label: "Class4",  y: 76  },
                                { label: "Class5",  y: 89  },
                                { label: "Class6",  y: 45  },
                                { label: "Class7",  y: 100  },
                                { label: "Class8",  y: 95  },
                                { label: "Class9",  y: 87  },
                                { label: "Class10",  y: 68  }
                            ]
                        }
                    ]
                });
                chartBar4.render();

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

