
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<script src="${appBaseUrl}/js/neuboard/pieChart.js"></script>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">
        <div class="content">
            <div class="header">
                Notice Board
            </div>
            <div class="main-content">
                <div class="panel panel-primary" style="min-height: 0px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Exam Notice</h3>
                    </div>
                    <div class="panel-body">
                       <p>
                           Final Exam Will be held in .... .....
                       </p>

                    </div>
                </div>
                <div class="panel panel-success" style="min-height: 0px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Admission Notice</h3>
                    </div>
                    <div class="panel-body">
                        <p>
                            Currently No admission is going on. it will start in January ..............
                        </p>

                    </div>
                </div>
                <div class="panel panel-info" style="min-height: 0px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Notice</h3>
                    </div>
                    <div class="panel-body">
                        <p>
                            Currently No admission is going on. it will start in January ..............
                        </p>

                    </div>
                </div>
                <div class="panel panel-info" style="min-height: 0px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Notice</h3>
                    </div>
                    <div class="panel-body">
                        <p>
                            Currently No admission is going on. it will start in January ..............
                        </p>

                    </div>
                </div>
                <div class="panel panel-info" style="min-height: 0px">
                <div class="panel-heading">
                    <h3 class="panel-title">Notice</h3>
                </div>
                <div class="panel-body">
                    <p>
                        Currently No admission is going on. it will start in January ..............
                    </p>

                </div>
            </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>

