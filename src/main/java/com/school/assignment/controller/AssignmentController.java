package com.school.assignment.controller;

import com.school.assignment.model.Assignment;
import com.school.assignment.service.AssignmentService;
import com.school.clazz.service.ClazzService;
import com.school.course.model.Course;
import com.school.course.model.CourseRoutine;
import com.school.course.service.CourseService;
import com.school.login.model.Login;
import com.school.user.model.Teacher;
import com.school.user.service.UserService;
import com.school.util.JsonStringToObjectConvereter;
import com.school.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.school.assignment.service")
public class AssignmentController {

    @Autowired
    AssignmentService assignmentService;


    @RequestMapping(value = "/private/courseAssignments.web",
            method = RequestMethod.GET)
    public String getCourseAssigments(ModelMap map, @RequestParam(value = "courseId") Integer courseId)
    {
        map.addAttribute("assignmentList", assignmentService.getAssignmentByCourseId(courseId));
        return "assignment/assignmentList";
    }
    @RequestMapping(value = "/private/addUpdateAssignment.web",
            method = RequestMethod.GET)
    public String initForm(ModelMap map, @RequestParam(value = "id" , required = false) Integer id)
    {
        System.out.println("id" + id);
        Assignment assignment = null;
        if(id==null)assignment = new Assignment();
        else assignment = assignmentService.getAssignmentById(id);
        map.addAttribute("assignment", assignment);
        return "assignment/addUpdateAssignment";
    }

    @RequestMapping(value = "/private/viewAssignment.web",
            method = RequestMethod.GET)
    public String viewAssignment(ModelMap map, @RequestParam(value = "id" , required = false) Integer id)
    {
        map.addAttribute("assignment", assignmentService.getAssignmentById(id));
        return "assignment/viewAssignment";
    }

    @RequestMapping(value = "/private/addUpdateAssignment.web",
            method = RequestMethod.POST)
    public String saveForm(@ModelAttribute("assignment")Assignment assignment
            , Principal principal
            ,RedirectAttributes redirectAttributes
            )
    {
        if(assignment.getMessageKey()==null || assignment.getMessageKey().isEmpty()){
            assignment.setCourseId(1);
            assignment.setPostDateTime(new Date());
            assignment.setMessageKey(Utility.getUniqueKey());
//            assignment.setUserId(Login.getLoginIdFromPrincipal(principal.getName()));
        }
        assignmentService.saveOrUpdate(assignment);
        return "redirect:addUpdateAssignment.web?id="+assignment.getAssignmentId();
    }




}
