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
    LoginService loginService;

    @Autowired
    LoginValidator loginValidator;
    @Autowired
    SignupValidator signupValidator;


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

    @RequestMapping(value = "/private/getUserData.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    ArrayList getUserData()
    {
        System.out.println("users: " + (ArrayList)loginService.getAllUsers());
        return (ArrayList)loginService.getAllUsers();
    }

    @RequestMapping(value = "/private/userData.web",
            method = RequestMethod.GET)
    public String userList()
    {
        return "login/userList";
    }
    @RequestMapping(value = "/theme.web",
            method = RequestMethod.GET)
    public String getTheme()
    {
        return "login/theme";
    }

    @RequestMapping(value = "/private/home.web",
            method = RequestMethod.GET)
    public String home(HttpServletRequest request,Principal principal)
    {
        Gson gson = new Gson();
        Login login = gson.fromJson(principal.getName(), Login.class);
        System.out.println("principal login:" + login);
        return "common/home";
    }

    @RequestMapping(value = "/private/dashboard.web",
            method = RequestMethod.GET)
    public String dashboard(HttpServletRequest request,Principal principal)
    {
        return "common/dashboard";
    }

    @RequestMapping(value = "/private/gallery.web",
            method = RequestMethod.GET)
    public String gallery(HttpServletRequest request,Principal principal)
    {
        return "common/gallery";
    }

    @RequestMapping(value = "/private/noticeBoard.web",
            method = RequestMethod.GET)
    public String noticeBoard(HttpServletRequest request,Principal principal)
    {
        return "common/noticeBoard";
    }

    @RequestMapping(value = "/private/admission.web",
            method = RequestMethod.GET)
    public String admissionInfo(HttpServletRequest request,Principal principal)
    {
        return "common/admission";
    }

    @RequestMapping(value = "/private/history.web",
            method = RequestMethod.GET)
    public String history(HttpServletRequest request,Principal principal)
    {
        return "common/history";
    }

    @RequestMapping(value = "/downloads.web",
            method = RequestMethod.GET)
    public String downloads()
    {
        return "common/downloads";
    }


}


