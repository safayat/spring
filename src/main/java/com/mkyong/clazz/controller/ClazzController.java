package com.mkyong.clazz.controller;

import com.mkyong.clazz.model.Attendance;
import com.mkyong.clazz.model.Clazz;
import com.mkyong.clazz.model.RollCall;
import com.mkyong.clazz.service.ClazzService;
import com.mkyong.login.model.Login;
import com.mkyong.user.service.UserService;
import com.mkyong.util.JsonStringToObjectConvereter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.mkyong.clazz.service")
public class ClazzController {

    @Autowired
    ClazzService clazzService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/private/getClassList.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    List getClassList()
    {
        return clazzService.getClassList();
    }

    @RequestMapping(value = "/private/classDetail.web",
            method = RequestMethod.GET)
    public String classDetail(@RequestParam(value = "classId")Integer classId,HttpServletRequest request)
    {
        request.setAttribute("classId",classId);
        return "class/ClassDetail";
    }

    @RequestMapping(value = "/private/rollCall.web",
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
    
    @RequestMapping(value = "/private/rollCall.web",
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
        map.addAttribute("studentCountMap",clazzService.getClassStudentCount());
        map.addAttribute("clazzList",clazzService.getClassList());
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
    Clazz getClass(@RequestParam(value = "classId")Integer classId)
    {
        return clazzService.getClassById(classId);
    }
}
