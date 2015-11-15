package com.school.user.controller;

import com.google.common.base.Strings;
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
import com.school.util.CriteriaContainer;
import com.school.util.DaoResult;
import com.school.util.JsonStringToObjectConvereter;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
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
import java.util.Arrays;
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
    public String initTeacherForm(ModelMap map, @RequestParam(value = "userId", required = false) Long userId){

        CommonUser commonUser = userId == null ? new Teacher(new Login()) : userService.getUserByUserId(userId, Teacher.class);
        map.addAttribute("teacher", commonUser);
        return "user/createTeacher";
    }

    @RequestMapping(value = "/admin/private/createStaff.web", method = RequestMethod.GET)
    public String initStaff(ModelMap map, @RequestParam(value = "userId", required = false) Long userId){
        CommonUser commonUser = userId == null ? new Staff(new Login()) : userService.getUserByUserId(userId, Staff.class);
        map.addAttribute("staff", commonUser);
        return "user/createStaff";
    }


    @RequestMapping(value = "/admin/private/createTeacher.web", method = RequestMethod.POST)
    public String processTeacherFormSubmit(@ModelAttribute Teacher teacher,
                                BindingResult result,
                                SessionStatus status,
                                RedirectAttributes redirectAttributes, HttpServletRequest request
                                ){

        teacher.getLogin().setUserType("teacher");
        teacherValidator.validate(teacher,result);
        System.out.println(result);
        if(!result.hasErrors()){
            status.setComplete();
            userService.saveOrUpdate(teacher);
        }

        return "redirect:" + ApplicationConstants.APP_URL(request) + "/private/profileInfo.web?userId=" + teacher.getUserId();
    }

    @RequestMapping(value = "/admin/private/update/teacher.web", method = RequestMethod.POST)
    @ResponseBody
    public DaoResult updateTeacher(@ModelAttribute Teacher teacher,
                                BindingResult result,
                                SessionStatus status,
                                RedirectAttributes redirectAttributes, HttpServletRequest request
                                ){

           return userService.update(teacher);

    }

    @RequestMapping(value = "/admin/private/update/student.web", method = RequestMethod.POST)
    @ResponseBody
    public DaoResult updateStudent(@ModelAttribute Student student,
                                BindingResult result,
                                SessionStatus status,
                                RedirectAttributes redirectAttributes, HttpServletRequest request
                                ){

           return userService.update(student);

    }

    @RequestMapping(value = "/admin/private/createStaff.web", method = RequestMethod.POST)
    public String createStaff(@ModelAttribute("staff")Staff staff,
                                RedirectAttributes redirectAttributes
                                ){
        staff.setStartingDesignation(staff.getStartingDesignation());
        CommonUser commonUser = staff;
        commonUser.getLogin().setUserType("staff");
        userService.saveOrUpdate(commonUser);
        return "redirect:createStaff.web?userId=" + staff.getUserId();
    }

    @RequestMapping(value = "/admin/private/createStudent.web", method = RequestMethod.GET)
    public String initStudentForm(ModelMap map,
                                  @RequestParam(value = "userId", required = false) Long userId){

        CommonUser commonUser = userId == null ? new Student(new Login()) : userService.getUserByUserId(userId, Student.class);
        map.addAttribute("student", commonUser);
//        map.addAttribute("classList",clazzService.getClassList());
        return "user/createStudent";
    }

    @RequestMapping(value = "/admin/private/createStudent.web", method = RequestMethod.POST)
    public String processStudentFormSubmit(@ModelAttribute("student")Student student,
                                BindingResult result,
                                SessionStatus status,
                                HttpServletRequest request){
        CommonUser commonUser = student;
        studentValidator.validate(student, result);
        if(!result.hasErrors()){
            status.setComplete();
            userService.saveOrUpdate(commonUser);
        }
        return "redirect:" + ApplicationConstants.APP_URL(request) + "/private/profileInfo.web?userId=" + student.getUserId();
    }



    @RequestMapping(value = "/private/userDetail.web", method = RequestMethod.GET)
    public @ResponseBody
    CommonUser getUserDetailByUserId(@RequestParam(value = "userId")Long userId){
        return userService.getUserByUserId(userId);
    }


    @RequestMapping(value = "/private/getTeacherList.web", method = RequestMethod.POST)
    public @ResponseBody
    List getTeacherList(@RequestParam(value = "name", required = false)String  name
            , @RequestParam(value = "designation", required = false)String designation
            , @RequestParam(value = "offset", required = false)int offset
            , @RequestParam(value = "limit", required = false)int limit

             ){
        if(limit <= 0){
            limit = 10;
        }
        if(offset<0)
            offset = 0;
        CriteriaContainer criteriaContainer = CriteriaContainer.instance();
        if(!Strings.isNullOrEmpty(designation)){
            criteriaContainer.add(Restrictions.eq("destination", designation));
        }
        if(!Strings.isNullOrEmpty(name)){
            criteriaContainer.add(Restrictions.like("fullName", "%" + name + "%"));
        }
        List list = userService.getDetailUserList(Teacher.class, criteriaContainer.list(),offset,limit);
        return list;
    }
    @RequestMapping(value = "/private/getStudentList.web", method = RequestMethod.POST)
    public @ResponseBody
    List getStudentList(@RequestParam(value = "classIds", required = false)Integer[] classIdList
            , @RequestParam(value = "rollNumber", required = false)String rollNumber
            , @RequestParam(value = "name", required = false)String fullName
            , @RequestParam(value = "offset", required = false)int offset
            , @RequestParam(value = "limit", required = false)int limit

             ){
        if(limit <= 0){
            limit = 10;
        }
        if(offset<0)
            offset = 0;
        CriteriaContainer criteriaContainer = CriteriaContainer.instance();
        if(!Strings.isNullOrEmpty(rollNumber)){
            criteriaContainer.add(Restrictions.eq("rollNumber", rollNumber));
        }
        if(!Strings.isNullOrEmpty(fullName)){
            criteriaContainer.add(Restrictions.like("fullName", "%" + fullName + "%"));
        }
        if(classIdList != null && classIdList.length>0){
            criteriaContainer.add(Restrictions.in("classId", Arrays.asList(classIdList)));
        }
        List list = userService.getDetailUserList(Student.class, criteriaContainer.list(),offset,limit);
        return list;
    }

    @RequestMapping(value = "/private/getTeacherList.web", method = RequestMethod.GET)
    public @ResponseBody
    List get_TeacherList(@RequestParam(value = "name", required = false)String  name
            , @RequestParam(value = "designation", required = false)String designation
            , @RequestParam(value = "offset", required = false)int offset
            , @RequestParam(value = "limit", required = false)int limit

             ){
        if(limit <= 0){
            limit = 10;
        }
        if(offset<0)
            offset = 0;
        CriteriaContainer criteriaContainer = CriteriaContainer.instance();
        if(!Strings.isNullOrEmpty(designation)){
            criteriaContainer.add(Restrictions.eq("destination", designation));
        }
        if(!Strings.isNullOrEmpty(name)){
            criteriaContainer.add(Restrictions.like("fullName", "%" + name + "%"));
        }
        List list = userService.getDetailUserList(Teacher.class, criteriaContainer.list(),offset,limit);
        return list;
    }
    @RequestMapping(value = "/private/getStudentList.web", method = RequestMethod.GET)
    public @ResponseBody
    List get_StudentList(@RequestParam(value = "classIds", required = false)Integer[] classIdList
            , @RequestParam(value = "rollNumber", required = false)String rollNumber
            , @RequestParam(value = "name", required = false)String fullName
            , @RequestParam(value = "offset", required = false)int offset
            , @RequestParam(value = "limit", required = false)int limit

             ){
        if(limit <= 0){
            limit = 10;
        }
        if(offset<0)
            offset = 0;
        CriteriaContainer criteriaContainer = CriteriaContainer.instance();
        if(!Strings.isNullOrEmpty(rollNumber)){
            criteriaContainer.add(Restrictions.eq("rollNumber", rollNumber));
        }
        if(!Strings.isNullOrEmpty(fullName)){
            criteriaContainer.add(Restrictions.like("fullName", "%" + fullName + "%"));
        }
        if(classIdList != null && classIdList.length>0){
            criteriaContainer.add(Restrictions.in("classId", Arrays.asList(classIdList)));
        }
        List list = userService.getDetailUserList(Student.class, criteriaContainer.list(),offset,limit);
        return list;
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



