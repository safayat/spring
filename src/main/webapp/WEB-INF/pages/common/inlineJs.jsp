<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageReqUri" value="${pageContext.request.requestURI}"/>

<script type="text/javascript">
    var app = angular.module('myApp', []);
    angular.element(document).ready(function () {
        <c:choose>
            <c:when test="${fn:endsWith(pageReqUri, 'user/students.jsp')}">
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'user/teachers.jsp')}">
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'user/createTeacher.jsp')}">
                $('#joiningDate').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'user/createStudent.jsp')}">
                $('#admissionDate').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'user/createStaff.jsp')}">
                $('#dateOfJoin').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'class/RollCall.jsp')}">
                $("#selectAll").click(function(){
                    $(".presentBox").prop('checked',$(this).prop('checked'));
                });
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'class/AttendanceHistory.jsp')}">
                $('#attendancedateFrom').datepicker();
                $('#attendancedateTo').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'course/ClazzRoutine.jsp')}">
                $("#toggleViewEditeMode").click(function()
                {
                    $(this).children("span").toggle();
                    $(".classRoutineListDisplay").toggle();
                });
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'course/courses.jsp')}">
                $("#syllabusAnchor").click(function () {
                    $(this).parent().addClass('active');
                    $('#courseInfoAnchor').parent().removeClass('active');
                    $("#courseInfoTable").hide();
                    $("#accordion").show();
                });
                $("#courseInfoAnchor").click(function () {
                    $(this).parent().addClass('active');
                    $('#syllabusAnchor').parent().removeClass('active');
                    $("#accordion").hide();
                    $("#courseInfoTable").show();
               });
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'exam/addUpdateExamGroup.jsp')}">
                $('#examStartDate').datepicker();
                $('#examEndDate').datepicker();
            </c:when>

            <c:when test="${fn:endsWith(pageReqUri, 'exam/markParam.jsp')}">
                $('#admissionDate').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'leave/addUpdateLeaveApplication.jsp')}">
                $('#fromDate').datepicker();
                $('#toDate').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'attendance/employeeRollCall.jsp')}">
                $("#selectAll").click(function(){
                    $(".presentBox").prop('checked',$(this).prop('checked'));
                });
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'calender/viewAttendance.jsp')}">
                $('#attendancedateFrom').datepicker();
                $('#attendancedateTo').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'attendance/viewAttendance.jsp')}">
                $('#attendancedateFrom').datepicker();
                $('#attendancedateTo').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'calender/addUpdateVaction.jsp')}">
                $('#startDate').datepicker();
                $('#endDate').datepicker();
            </c:when>
            <c:when test="${fn:endsWith(pageReqUri, 'admission/admissionForm.jsp')}">
                $('#dateOfBirth').datepicker();
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>


    });
    <c:choose>
        <c:when test="${fn:endsWith(pageReqUri, 'user/students.jsp')}">
            function MyController($scope, $http) {
                $http({method: 'GET', url: 'getStudentList.web'}).
                        success(function (data, status, headers, config) {
                            $scope.students = data;
                        });
            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'user/teachers.jsp')}">
            function MyController($scope, $http){
                $http({method: 'GET', url: 'getTeacherList.web'}).
                        success(function(data, status, headers, config) {
                            $scope.teachers = data;
                        });

            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'user/createTeacher.jsp')}">
            function MyController($scope, $http){
                $http({method: 'GET', url: 'getTeacherList.web'}).
                        success(function(data, status, headers, config) {
                            $scope.teachers = data;
                        });

            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'calss/ClassList.jsp')}">
            function MyController($scope, $http){
                $http({method: 'GET', url: 'getClassList.web'}).
                        success(function(data, status, headers, config) {
                            $scope.clazzList = data;

                        });
            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'class/ClassDetail.jsp')}">
            function MyController($scope, $http){
                $http({method: 'GET', url: 'getClass.web?classId=${requestScope.classId}'}).
                        success(function(data, status, headers, config) {
                            $scope.clazz = data;

                        });
            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'class/RollCall.jsp')}">
            function MyController($scope, $http){
                <%--$scope.clazzList = '${classList}';--%>
                $scope.clazzList = '${classList}';
                $scope.clazzList = JSON.parse($scope.clazzList);
                console.log($scope.clazzList);
                $scope.getStudentInfo = function(){
                    $http({method: 'GET', url: 'getClass.web?classId='+$('#classIdSelect').val()}).
                            success(function(data, status, headers, config) {
                                $scope.clazz = data;

                            });
                };

            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'class/AttendanceHistory.jsp')}">
            console.log("in calss/AttendanceHistory.jsp");

            function formController($scope, $http) {
                // create a blank object to hold our form information
                // $scope will allow this to pass between controller and view
                $scope.formData = {};
                $http({method: 'GET', url: 'getStudentList.web'}).
                        success(function(data, status, headers, config) {
                            $scope.studentList = data;
                        });
                // process the form
                $scope.processForm = function() {
                    $scope.formData.attendancedateFrom = $('#attendancedateFrom').val();
                    $scope.formData.attendancedateTo = $('#attendancedateTo').val();
                    $http({
                        method  : 'POST',
                        url     : '${appBaseUrl}/private/AttendanceHistory.web',
                        data    : $.param($scope.formData),  // pass in data as strings
                        headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                console.log(data);
                                $scope.absentDateList = data;

                            });
                };
            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'leave/viewLeaveApplication.jsp')}">
            function MyController($scope, $http){
                $http({method: 'GET', url: '${appBaseUrl}/private/getLeaveApplicationData.web'}).
                        success(function(data, status, headers, config) {
                            $scope.leaveApplications = data;

                });

            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'leave/viewAttendance.jsp')}">
            function formController($scope, $http) {
                // create a blank object to hold our form information
                // $scope will allow this to pass between controller and view
                $scope.formData = {};

                // process the form
                $scope.processForm = function() {
                    $scope.formData.fromDate = $('#attendancedateFrom').val();
                    $scope.formData.toDate = $('#attendancedateTo').val();
                    $http({
                        method  : 'POST',
                        url     : '${appBaseUrl}/private/getFilteredAttendance.web',
                        data    : $.param($scope.formData),  // pass in data as strings
                        headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                console.log(data);
                                $scope.attendanceList = data;

                            });
                };
            }
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'calender/academicCalender.jsp')}">

            function MyController($scope){

                var months = [{"month":{"name":"January","value":0,"days":31}},{"month":{"name":"February","value":1,"days":28}},{"month":{"name":"March","value":2,"days":31}},{"month":{"name":"April","value":3,"days":30}},{"month":{"name":"May","value":4,"days":31}},{"month":{"name":"June","value":5,"days":30}},{"month":{"name":"July","value":6,"days":31}},{"month":{"name":"August","value":7,"days":31}},{"month":{"name":"September","value":8,"days":30}},{"month":{"name":"October","value":9,"days":31}},{"month":{"name":"November","value":10,"days":30}},{"month":{"name":"December","value":11,"days":31}}];
                var defaultDate = new Date();
                $scope.academicMonth = defaultDate.getMonth();
                $scope.updateCalender = function(){

                    defaultDate.setMonth($scope.academicMonth);
                    defaultDate.setDate(1);
                    $scope.academicMonthDays = getDaysInAMonth($scope.academicMonth);
                    $scope.academicPreviousMonthDays = getDaysInAMonth($scope.academicMonth-1);
                    $scope.dayIndex= $scope.academicPreviousMonthDays-defaultDate.getDay();

                    var totoalRow = parseInt(($scope.academicMonthDays+defaultDate.getDay())/7);
                    if(($scope.academicMonthDays+defaultDate.getDay())%7>0){
                        totoalRow++;
                    }
                    $scope.weekArray = [];
                    for(var i=0;i<totoalRow;i++){
                        $scope.weekArray.push(i);
                    }

                }

                $scope.updateCalender();

                function getDaysInAMonth(monthNo){
                    if(monthNo<0)monthNo=11;
                    if(monthNo>11)monthNo=monthNo%12;
                    return months.filter(function(item){
                        return item.month.value ==  monthNo
                    }).map(function(item){
                                return item.month.days;
                            }).pop();
                }
            }
            app.filter("datePosition", function() {
                return function(input,pmdays,mdays,week,day) {
                    input = input + 7*week + day;
                    if(week ==0){
                        if(input<=pmdays)
                            return input;
                    }
                    input = input - pmdays;
                    if(input>mdays)
                        return input%mdays;
                    return input;

                }

            });
        </c:when>
        <c:when test="${fn:endsWith(pageReqUri, 'login/userList.jsp')}">
            function MyController($scope, $http) {
                $http({method: 'GET', url: 'getUserData.web'}).
                        success(function (data, status, headers, config) {
                            $scope.usersInfo = data;
                        }).
                        error(function (data, status, headers, config) {
                            // called asynchronously if an error occurs
                            // or server returns response with an error status.
                        });
            }
        </c:when>
        <c:otherwise>
            console.log("${pageContext.request.requestURI}");
        </c:otherwise>
    </c:choose>

</script>