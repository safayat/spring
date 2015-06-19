package com.mkyong.user.controller;

import com.google.gson.Gson;
import com.mkyong.clazz.model.Clazz;
import com.mkyong.clazz.service.ClazzService;
import com.mkyong.login.model.Login;
import com.mkyong.login.service.LoginService;
import com.mkyong.login.validator.LoginValidator;
import com.mkyong.login.validator.SignupValidator;
import com.mkyong.user.model.CommonUser;
import com.mkyong.user.model.Staff;
import com.mkyong.user.model.Student;
import com.mkyong.user.model.Teacher;
import com.mkyong.user.service.UserService;
import com.mkyong.user.validator.StudentValidator;
import com.mkyong.user.validator.TeacherValidator;
import com.mkyong.util.ApplicationConstants;
import com.mkyong.util.DaoResult;
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
@ComponentScan("com.mkyong.user.service")
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
    public String initTeacherForm(ModelMap map, @RequestParam(value = "teacherId", required = false) Integer teacherId){
        CommonUser commonUser = null;
        System.out.println("teacherId:" + teacherId);
        if(teacherId == null){
            commonUser = new Teacher();
        }else {
            commonUser = userService.getUserByUserId(teacherId, Teacher.class);

        }
        map.addAttribute("teacher", commonUser);
        return "user/createTeacher";
    }

    @RequestMapping(value = "/admin/private/createStaff.web", method = RequestMethod.GET)
    public String initStaff(ModelMap map, @RequestParam(value = "staffId", required = false) Integer staffId){
        CommonUser commonUser = null;
        if(staffId == null){
            commonUser = new Staff();
        }else {
            commonUser = userService.getUserByUserId(staffId, Staff.class);

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
        return "redirect:createTeacher.web?teacherId=" + teacher.getTeacherId();
    }

    @RequestMapping(value = "/admin/private/createStaff.web", method = RequestMethod.POST)
    public String createStaff(@ModelAttribute("staff")Staff staff,
                                RedirectAttributes redirectAttributes
                                ){
        staff.setStartingDesignation(staff.getStartingDesignation());
        CommonUser commonUser = staff;
        commonUser.setUserType("staff");
        userService.saveOrUpdate(commonUser);
        return "redirect:createStaff.web?staffId=" + staff.getStaffId();
    }

    @RequestMapping(value = "/admin/private/createStudent.web", method = RequestMethod.GET)
    public String initStudentForm(ModelMap map, @RequestParam(value = "studentId", required = false) Integer studentId){

        CommonUser commonUser = null;
        if(studentId ==null){
            commonUser = new Student();
        }else{
            commonUser = userService.getUserByUserId(studentId, Student.class);
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
        return "redirect:createStudent.web?studentId=" + student.getStudentId();
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



