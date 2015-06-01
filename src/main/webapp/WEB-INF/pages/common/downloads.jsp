<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<script src="${appBaseUrl}/js/neuboard/pieChart.js"></script>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Download Section</h1>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <button class="btn btn-success input-lg"><i class="fa fa-download"></i> Prospectus</button>
                    <button class="btn btn-primary input-lg"><i class="fa fa-download"></i> Syllabus</button>
                </div>
            </div>
            </div>

        </section>
    </tiles:putAttribute>
</tiles:insertDefinition>

