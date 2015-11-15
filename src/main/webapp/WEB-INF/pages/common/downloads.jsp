<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<script src="${appBaseUrl}/js/neuboard/pieChart.js"></script>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">
        <div class="content">
            <div class="header">
                <h1>Download Section</h1>
            </div>
            <div class="main-content">
                    <button class="btn btn-success input-lg"><i class="fa fa-download"></i> Prospectus</button>
                    <button class="btn btn-primary input-lg"><i class="fa fa-download"></i> Syllabus</button>
            </div>


        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>

