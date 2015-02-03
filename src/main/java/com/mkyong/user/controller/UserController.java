package com.mkyong.user.controller;

import com.google.gson.Gson;
import com.mkyong.login.model.Login;
import com.mkyong.login.service.LoginService;
import com.mkyong.login.validator.LoginValidator;
import com.mkyong.login.validator.SignupValidator;
import com.mkyong.user.model.CommonUser;
import com.mkyong.user.model.Teacher;
import com.mkyong.util.ApplicationConstants;
import com.mkyong.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller

@Configuration
@ComponentScan("com.mkyong.user.service")
public class UserController {

    @RequestMapping(value = "/private/createTeacher.web", method = RequestMethod.GET)
    public String initForm(ModelMap map){
        CommonUser commonUser = new Teacher();
        map.addAttribute("teacher", commonUser);
        return "user/createUser";
    }

    @RequestMapping(value = "/private/createTeacher.web", method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("teacher")CommonUser commonUser,
                                BindingResult result,
                                SessionStatus status,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes){

        return "user/createUser";
    }



}


