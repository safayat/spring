package com.school.clazz.controller;

import com.school.clazz.model.Attendance;
import com.school.clazz.model.Clazz;
import com.school.clazz.model.RollCall;
import com.school.clazz.service.ClazzService;
import com.school.login.model.Login;
import com.school.user.model.CommonUser;
import com.school.user.model.Student;
import com.school.user.model.Teacher;
import com.school.user.service.UserService;
import com.school.util.JsonStringToObjectConvereter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.school.clazz.service")
public class ClazzController {

    @Autowired
    ClazzService clazzService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/private/getClassList.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    List getClassList(@RequestParam(value = "includeClassCaptain", required = false)boolean includeClassCaptain
            , @RequestParam(value = "includeClassTeacher", required = false)boolean includeClassTeacher
            , @RequestParam(value = "includeStudentCount", required = false)boolean includeStudentCount)
    {
        return clazzService.getClassList(includeClassTeacher,includeClassCaptain, includeStudentCount);
    }


    @RequestMapping(value = "/private/classDetail.web",
            method = RequestMethod.GET)
    public String classDetail(@RequestParam(value = "classId")Integer classId,HttpServletRequest request)
    {
        request.setAttribute("classId",classId);
        return "class/ClassDetail";
    }

    @RequestMapping(value = "/edu/private/rollCall.web",
            method = RequestMethod.POST)
    public String rollCall(@RequestParam(value = "classId")Integer classId,
                           @RequestParam(value = "presentStudentList")String[] studentList,
                           HttpServletRequest request, Principal principal)
    {
        Login login = (Login)JsonStringToObjectConvereter.
                      getInstance().
                            getObject(principal.getName(), Login.class);

        clazzService.saveRollCall(classId,
                studentList,
                userService.getTeacherByUserId(login.getUserId()).getTeacherId());
        request.setAttribute("classId",classId);
        return "class/ClassDetail";
    }
    
    @RequestMapping(value = "/edu/private/rollCall.web",
            method = RequestMethod.GET)
    public String rollCall(@RequestParam(value = "classId")Integer classId,
                           ModelMap map,
                           HttpServletRequest request)
    {
        request.setAttribute("classId",classId);
        try{
            map.addAttribute("classList",
                    JsonStringToObjectConvereter.getInstance().objectToJson(clazzService.getClassList()));

        }catch (Exception e){
            e.printStackTrace();
        }

        return "class/RollCall";
    }

    @RequestMapping(value = "/private/classList.web",
            method = RequestMethod.GET)
    public String classList(ModelMap map)
    {
        return "class/ClassList";
    }
    @RequestMapping(value = "/private/AttendanceHistory.web",
            method = RequestMethod.GET)
    public String studentAttendanceHistory()
    {
        return "class/AttendanceHistory";
    }

    @RequestMapping(value = "/private/AttendanceHistory.web",
            method = RequestMethod.POST,
            produces = "application/json")
    public @ResponseBody
    List getStudentAttendanceHistory(@RequestParam(value = "studentId")Integer studentId,
                                              @RequestParam(value = "attendancedateFrom")String dateFrom,
                                              @RequestParam(value = "attendancedateTo")String dateTo,
                                              HttpServletRequest request
                                              )
    {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        List result = null;
        try{
            result = clazzService.getIndividualAbsenceHistoryByDate(studentId, formatter.parse(dateFrom), formatter.parse(dateTo));

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = "/private/getClass.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    Clazz getClass(@RequestParam(value = "classId")Integer classId
            , @RequestParam(value = "withStudents", required = false, defaultValue = "true")boolean withStudents
            , @RequestParam(value = "withStudentProfile", required = false, defaultValue = "true")boolean withStudentProfile
            , @RequestParam(value = "withTeacher", required = false, defaultValue = "true")boolean withTeacher
            , @RequestParam(value = "withCaptain", required = false, defaultValue = "true")boolean withCaptain
            , @RequestParam(value = "withStudentUserInfo", required = false,  defaultValue = "true")boolean withStudentUserInfo)
    {
        Clazz clazz = clazzService.getClassById(classId, withStudents);

        if(withStudents && withStudentProfile){
            userService.loadUserProfiles((List<CommonUser>)(List<?>)clazz.getStudentList());
        }

        if(withStudents && withStudentUserInfo){
            userService.loadUserLoginInfos((List<CommonUser>)(List<?>)clazz.getStudentList());
        }

        if(withTeacher && clazz.getClassTeacherId() != null){
            Teacher teacher = userService.getUser(Teacher.class, clazz.getClassTeacherId());
            clazz.setClassTeacher(teacher);
        }

        if(withCaptain && clazz.getClassCaptainId() != null){
             Student captain = userService.getUser(Student.class, clazz.getClassCaptainId());
            clazz.setClassCaptain(captain);
        }

        return clazz;
    }

    @RequestMapping(value = "/admin/private/addUpdateClass.web",
            method = RequestMethod.GET)
    public String initClassForm(@RequestParam(value = "classId", required = false)Integer classId, ModelMap map)
    {
        Clazz clazz = null;
        if(classId == null){
            clazz = new Clazz();
        }else{
            clazz = clazzService.getClassById(classId);
        }
        map.addAttribute("clazz",clazz);
        map.addAttribute("teacherList", userService.getUserList(Teacher.class));
        return "class/addUpdateClass";
    }
    @RequestMapping(value = "/admin/private/addUpdateClass.web",
            method = RequestMethod.POST)
    public @ResponseBody int processClassForm(RedirectAttributes redirectAttributes, @ModelAttribute("clazz")Clazz clazz, @ModelAttribute("currentClazzMap")Map currentClazzMap)
    {
        clazzService.saveOrUpdate(clazz);
        return clazz.getClassId();
    }
}
