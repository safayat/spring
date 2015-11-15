package com.school.leave.controller;

import com.school.leave.model.LeaveApplication;
import com.school.leave.service.LeaveService;
import com.school.login.model.Login;
import com.school.login.service.LoginService;
import com.school.menu.model.Menu;
import com.school.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */


@Controller
@ComponentScan("com.school.leave.service")
public class LeaveController {
    @Autowired
    private LeaveService leaveService;

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/private/addUpdateLeaveApplication.web", method = RequestMethod.GET)
    public String initLeaveApplication(@RequestParam(value = "leaveId", required = false)Integer leaveId, ModelMap map){
        LeaveApplication leaveApplication = null;
        if(leaveId==null){
            leaveApplication = new LeaveApplication();
        }
        else{
            leaveApplication = leaveService.getById(leaveId);
        }
        map.addAttribute("leaveApplication",leaveApplication);
        return "leave/addUpdateLeaveApplication";
    }

    @RequestMapping(value = "/private/addUpdateLeaveApplication.web", method = RequestMethod.POST)
    public String addUpdateLeaveApplication(@ModelAttribute("leaveApplication")LeaveApplication leaveApplication,RedirectAttributes redirectAttributesm, Principal principal){

        System.out.println("in post");
//        leaveApplication.setApplicantUserId(Login.getLoginIdFromPrincipal(principal.getName()));
        if(leaveApplication.getLeaveId()==null){
            leaveApplication.setLeaveStatus("pending");
        }
        leaveService.saveOrUpdate(leaveApplication);
        return "redirect:viewLeaveApplication.web";
    }

    @RequestMapping(value = "/private/viewLeaveApplication.web", method = RequestMethod.GET)
    public String viewLeaveApplication(@RequestParam(value = "type", defaultValue = "all", required = false)String type,ModelMap map){
        return "leave/viewLeaveApplication";
    }

    @RequestMapping(value = "/private/approveLeave.web", method = RequestMethod.GET)
    public String approveLeave(@RequestParam(value = "leaveId")Integer leaveId,ModelMap map, Principal principal){
        LeaveApplication leaveApplication = leaveService.getById(leaveId);
        map.addAttribute("leaveApplication",leaveApplication);
        if(leaveApplication.getApplicantUser().getUserType().equals("student") == false)
            map.addAttribute("+",loginService.getUsersByType(leaveApplication.getApplicantUser().getUserType()));
        return "leave/approveLeave";
    }

    @RequestMapping(value = "/private/getLeaveApplicationData.web", method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
     List<LeaveApplication> getLeaveApplicationData(@RequestParam(value = "type", defaultValue = "all", required = false)String type){
        return leaveService.getAll(type);
    }

}
