package com.school.user.controller;

import com.google.gson.Gson;
import com.school.clazz.model.Clazz;
import com.school.clazz.service.ClazzService;
import com.school.login.model.Login;
import com.school.login.service.LoginService;
import com.school.login.validator.LoginValidator;
import com.school.login.validator.SignupValidator;
import com.school.user.model.CommonUser;
import com.school.user.model.Staff;
import com.school.user.model.Student;
import com.school.user.model.Teacher;
import com.school.user.service.UserService;
import com.school.user.validator.StudentValidator;
import com.school.user.validator.TeacherValidator;
import com.school.util.ApplicationConstants;
import com.school.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller

@Configuration
@ComponentScan("com.school.user.service")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    ClazzService clazzService;

    @Autowired
    StudentValidator studentValidator;
    @Autowired
    TeacherValidator teacherValidator;
    @Autowired
    SignupValidator signupValidator;


    @RequestMapping(value = "/admin/private/createTeacher.web", method = RequestMethod.GET)
    public String initTeacherForm(ModelMap map, @RequestParam(value = "userId", required = false) Integer userId){
        CommonUser commonUser = null;
        if(userId == null){
            commonUser = new Teacher();
        }else {
            commonUser = userService.getUserByUserId(userId, Teacher.class);

        }
        map.addAttribute("teacher", commonUser);
        return "user/createTeacher";
    }

    @RequestMapping(value = "/admin/private/createStaff.web", method = RequestMethod.GET)
    public String initStaff(ModelMap map, @RequestParam(value = "userId", required = false) Integer userId){
        CommonUser commonUser = null;
        if(userId == null){
            commonUser = new Staff();
        }else {
            commonUser = userService.getUserByUserId(userId, Staff.class);

        }
        map.addAttribute("staff", commonUser);
        return "user/createStaff";
    }

    @RequestMapping(value = "/admin/private/createTeacher.web", method = RequestMethod.POST)
    public String processTeacherFormSubmit(@ModelAttribute("teacher")Teacher teacher,
                                BindingResult result,
                                SessionStatus status,
                                RedirectAttributes redirectAttributes
                                ){
        CommonUser commonUser = teacher;
        commonUser.setUserType("teacher");
        teacherValidator.validate(teacher,result);
        System.out.println(result);
        if(!result.hasErrors()){
            status.setComplete();
            userService.saveOrUpdate(commonUser);
        }
        return "redirect:createTeacher.web?userId=" + teacher.getUserId();
    }

    @RequestMapping(value = "/admin/private/createStaff.web", method = RequestMethod.POST)
    public String createStaff(@ModelAttribute("staff")Staff staff,
                                RedirectAttributes redirectAttributes
                                ){
        staff.setStartingDesignation(staff.getStartingDesignation());
        CommonUser commonUser = staff;
        commonUser.setUserType("staff");
        userService.saveOrUpdate(commonUser);
        return "redirect:createStaff.web?userId=" + staff.getUserId();
    }

    @RequestMapping(value = "/admin/private/createStudent.web", method = RequestMethod.GET)
    public String initStudentForm(ModelMap map,
                                  @RequestParam(value = "userId", required = false) Integer userId){

        CommonUser commonUser = null;
        if(userId ==null){
            commonUser = new Student();
        }else{

            commonUser = userService.getUserByUserId(userId, Student.class);
        }
        map.addAttribute("student", commonUser);
        map.addAttribute("classList",clazzService.getClassList());
        return "user/createStudent";
    }

    @RequestMapping(value = "/admin/private/createStudent.web", method = RequestMethod.POST)
    public String processStudentFormSubmit(@ModelAttribute("student")Student student,
                                BindingResult result,
                                SessionStatus status,
                                RedirectAttributes redirectAttributes){
        CommonUser commonUser = student;
        commonUser.setUserType("student");
        studentValidator.validate(student, result);
        if(!result.hasErrors()){
            status.setComplete();
            userService.saveOrUpdate(commonUser);
        }
        return "redirect:createStudent.web?userId=" + student.getUserId();
    }


    @RequestMapping(value = "/private/getTeacherList.web", method = RequestMethod.GET)
    public @ResponseBody
    List getTeacherList(){
        List list = userService.getUserList(Teacher.class);
        return list;
    }

    @RequestMapping(value = "/private/getStudentList.web", method = RequestMethod.GET)
    public @ResponseBody
    List getStudentList(){
         return userService.getUserList(Student.class);
    }


    @RequestMapping(value = "/private/showTeachers.web", method = RequestMethod.GET)
    public String showTeachers(){
        return "user/teachers";
    }

    @RequestMapping(value = "/private/showStudents.web", method = RequestMethod.GET)
    public String showStudents(){
        return "user/students";
    }



}



