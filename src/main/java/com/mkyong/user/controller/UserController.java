package com.mkyong.user.controller;

import com.google.gson.Gson;
import com.mkyong.login.model.Login;
import com.mkyong.login.service.LoginService;
import com.mkyong.login.validator.LoginValidator;
import com.mkyong.login.validator.SignupValidator;
import com.mkyong.user.model.CommonUser;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
    StudentValidator studentValidator;
    @Autowired
    TeacherValidator teacherValidator;
    @Autowired
    SignupValidator signupValidator;


    @RequestMapping(value = "/private/createTeacher.web", method = RequestMethod.GET)
    public String initTeacherForm(ModelMap map){
        CommonUser commonUser = new Teacher();
        commonUser.setLogin(new Login());
        map.addAttribute("teacher", commonUser);
        return "user/createTeacher";
    }

    @RequestMapping(value = "/private/createTeacher.web", method = RequestMethod.POST)
    public String processTeacherFormSubmit(@ModelAttribute("teacher")Teacher teacher,
                                BindingResult result,
                                SessionStatus status
                                ){
        CommonUser commonUser = teacher;
        teacherValidator.validate(teacher, result);
        System.out.println(result.getAllErrors());
        if(!result.hasErrors()){
            status.setComplete();
            userService.saveOrUpdate(commonUser);
        }
        return "user/createTeacher";
    }

    @RequestMapping(value = "/private/createStudent.web", method = RequestMethod.GET)
    public String initStudentForm(ModelMap map){
        CommonUser commonUser = new Student();
        map.addAttribute("student", commonUser);
        return "user/createStudent";
    }

    @RequestMapping(value = "/private/createStudent.web", method = RequestMethod.POST)
    public String processStudentFormSubmit(@ModelAttribute("student")Student student,
                                BindingResult result,
                                SessionStatus status){
        CommonUser commonUser = student;
        studentValidator.validate(student, result);
        if(!result.hasErrors()){
            status.setComplete();
            userService.saveOrUpdate(commonUser);
        }
        return "user/createStudent";
    }

    @RequestMapping(value = "/private/getTeacherList.web", method = RequestMethod.GET)
    public @ResponseBody
    List getTeacherList(){
        return userService.getUserList(Teacher.class);
    }


    @RequestMapping(value = "/private/showTeachers.web", method = RequestMethod.GET)
    public String showTeachers(){
        return "user/teachers";
    }



}


