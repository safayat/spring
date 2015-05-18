
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Gallery</h1>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">

                            <div class="panel-body">
                                <div class="col-md-3" style="height: 300px">
                                    <a href="#" class="thumbnail">
                                        <img style="height: 300px" src="http://psdbd.org/wp-content/uploads/2011/05/PSD202.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-md-6">

                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                        <!-- Indicators -->
                                        <ol class="carousel-indicators">
                                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                        </ol>

                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox" style="height: 300px">
                                            <div class="item active">
                                                <img src="http://media.lehighvalleylive.com/bethlehem_impact/photo/liberty-high-school-building-15fc8bfb5b11c882.jpg" alt="...">
                                                <div class="carousel-caption">

                                                </div>
                                            </div>
                                            <div class="item">
                                                <img src="http://www.wellesleyhighschool2002.com/wp-content/uploads/2012/11/a.jpg" alt="...">
                                                <div class="carousel-caption">
                                                    ...
                                                </div>
                                            </div>
                                            <div class="item">
                                                <img src="http://i.gzn.jp/img/2010/07/28/k-on_toyosato/toyosato_34.jpg" alt="...">
                                                <div class="carousel-caption">
                                                    ...
                                                </div>
                                            </div>
                                            ...
                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" >
                                            <span style="margin-top: 30%" class="fa fa fa-chevron-circle-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                            <span style="margin-top: 30%" class="fa fa fa-chevron-circle-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>

                                <div class="col-md-3" >
                                    <a href="#" class="thumbnail">
                                        <img style="height: 300px" src="http://bdnews24.com/bangladesh/article573825.bdnews/BINARY/w940/December............Twenty+Seven+23.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-md-3" >
                                    <a href="#" class="thumbnail">
                                        <img style="height: 300px" src="http://www.admissions.cn/AboutChina/images/200892313465.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-md-3" >
                                    <a href="#" class="thumbnail">
                                        <img style="height: 300px" src="http://www.trigger-proof.com/wp-content/uploads/2013/04/Graduation-Students2.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-md-3" >
                                    <a href="#" class="thumbnail">
                                        <img style="height: 300px" src="http://www.yorkhighschool.co.uk/_files/images/exam.gif" alt="...">
                                    </a>
                                </div>
                                <div class="col-md-3" >
                                    <a href="#" class="thumbnail">
                                        <img style="height: 300px" src="http://resources3.news.com.au/images/2012/02/29/1226285/546683-merrylands-east-primary-school.jpg" alt="...">
                                    </a>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
            </section>
        </section>
        <script type="text/javascript">
        var app = angular.module('myApp', []);

        angular.element(document).ready(function () {


        });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

