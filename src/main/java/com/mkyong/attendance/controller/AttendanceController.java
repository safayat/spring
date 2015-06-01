package com.mkyong.attendance.controller;

import com.mkyong.attendance.model.EmployeeAttendance;
import com.mkyong.attendance.service.AttendanceService;
import com.mkyong.login.model.Login;
import com.mkyong.login.service.LoginService;
import com.mkyong.util.Utility;
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
import java.util.*;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.mkyong.attendance.service")
public class AttendanceController {

    @Autowired
    AttendanceService attendanceService;

    @Autowired
    LoginService loginService;

    @RequestMapping(value = "/private/attendance.web", method = RequestMethod.GET)
    public String initAttendance(ModelMap map){

        map.addAttribute("empolyeeUserList",loginService.getEmployeeUsers());
        return "attendance/employeeRollCall";
    }

    @RequestMapping(value = "/private/viewAttendance.web", method = RequestMethod.GET)
    public String viewAttendance(ModelMap map){

        map.addAttribute("userList",loginService.getEmployeeUsers());
        return "attendance/viewAttendance";
    }

    @RequestMapping(value = "/private/getFilteredAttendance.web", method = RequestMethod.POST,
            produces = "application/json")
    public @ResponseBody
    List<EmployeeAttendance> getFilteredAttendance(@RequestParam("fromDate")String fromDate, @RequestParam("toDate")String toDate, @RequestParam(value = "userId", required = false)Integer userId  ){
        return attendanceService.getAttendanceList(Utility.toDate(fromDate), Utility.toDate(toDate), userId);
    }

    @RequestMapping(value = "/private/attendance.web", method = RequestMethod.POST)
    public String saveAttendance(@RequestParam("presentEmployeeList")String[]presentEmployeeList, RedirectAttributes redirectAttributes){

        List<EmployeeAttendance> attendanceList = new ArrayList<>();
        Map<String,String> presentMap = new HashMap<>();
        for(String id:presentEmployeeList){
            presentMap.put(id,id);
        }
        List<Login> userList = loginService.getEmployeeUsers();
        for(Login user : userList){
            EmployeeAttendance employeeAttendance = new EmployeeAttendance();
            employeeAttendance.setUserId(user.getUserId());
            if(presentMap.get(String.valueOf(user.getUserId()))!=null)
                employeeAttendance.setPresent(true);
            else
                employeeAttendance.setPresent(false);
            employeeAttendance.setRollCallDate(new Date());
            attendanceList.add(employeeAttendance);
        }
        try {
            attendanceService.saveAttendance(attendanceList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:attendance.web";
    }

}
