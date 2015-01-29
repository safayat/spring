package com.mkyong.login.controller;

import com.google.gson.Gson;
import com.mkyong.login.service.LoginService;
import com.mkyong.login.validator.SignupValidator;
import com.mkyong.profile.model.Profile;
import com.mkyong.profile.service.ProfileService;
import com.mkyong.util.ApplicationConstants;
import com.mkyong.util.DaoResult;
import com.mkyong.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.mkyong.login.model.Login;
import com.mkyong.login.service.LoginService;
import com.mkyong.login.validator.LoginValidator;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
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
@ComponentScan("com.mkyong.login.service")
public class LoginController {

    @Autowired
    LoginValidator loginValidator;
    @Autowired
    SignupValidator signupValidator;

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login.web", method = RequestMethod.GET)
    public String initForm(ModelMap map, Principal principal)
    {
        if(principal != null){
            return "common/home";
        }
        map.addAttribute("login",new Login());
        return ApplicationConstants.LOGIN_PAGE;
    }

    @RequestMapping(value = "/signup.web", method = RequestMethod.GET)
    public String initSignupForm(ModelMap map)
    {
        if(map.get("signup")==null){
            map.addAttribute("signup",new Login());
        }
        return "login/Signup";
    }

    @RequestMapping(value = "/signup.web", method = RequestMethod.POST)
    public String processSignupSubmit(@ModelAttribute("signup")Login login,
                                BindingResult result,
                                SessionStatus status,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes)
    {
        String target = "login/LoginSuccess";
        System.out.println("login :" + login);
        signupValidator.validate(login, result);
        login.setPassword(new BCryptPasswordEncoder().encode(login.getPassword()));
        if (result.hasErrors()) {
            target = "login/Signup";
        } else {
            status.setComplete();
            DaoResult daoResult = loginService.saveUser(login);
            if(daoResult.isSuccessful()){
                request.setAttribute("successMsg", daoResult.getMessage());
                target = "redirect:login.web";
            }else{
                request.setAttribute("errorMsg",daoResult.getMessage());
                target = "login/Signup";
            }
        }
        return target;
    }
    @RequestMapping(value = "/private/getUserData.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    ArrayList getUserData()
    {
        return (ArrayList)loginService.getAllUsers();
    }

    @RequestMapping(value = "/private/userData.web",
            method = RequestMethod.GET)
    public String userList()
    {
        return "login/userList";
    }

    @RequestMapping(value = "/private/home.web",
            method = RequestMethod.GET)
    public String home(HttpServletRequest request,Principal principal)
    {
        System.out.println("principal info:" + principal.getName());
        Gson gson = new Gson();
        Login login = gson.fromJson(principal.getName(), Login.class);
        return "common/home";
    }


}


