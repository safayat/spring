package com.mkyong.login.controller;

import com.mkyong.login.service.LoginService;
import com.mkyong.util.ApplicationConstants;
import com.mkyong.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
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
    private LoginService loginService;

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String initForm(ModelMap map,HttpServletRequest request)
    {
        if(request.getSession().getAttribute(ApplicationConstants.LOGIN_DATA)!=null){
            return "common/home";
        }
        map.addAttribute("login",new Login());
        return "login/login";
    }

    @RequestMapping(value = "/signup.htm", method = RequestMethod.GET)
    public String initSignupForm(ModelMap map)
    {
        if(map.get("signup")==null)
            map.addAttribute("signup",new Login());
        return "login/Signup";
    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String logout(ModelMap map,HttpServletRequest request)
    {
        request.getSession().removeAttribute(ApplicationConstants.LOGIN_DATA);
        map.addAttribute("login",new Login());
        return "login/login";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("login")Login login,
                                BindingResult result,
                                SessionStatus status,
                                HttpServletRequest request)
    {
    	
        loginValidator.validate(login, result);
        System.out.println("in processSubmit");
        if (result.hasErrors()) {
            //if validator failed
        	System.out.println("in processSubmit failured");
            return "login/login";
        } else {
            status.setComplete();
            System.out.println("in processSubmit success");
            Login oldLogin=loginService.findByUserName(login.getUserName());
            if(oldLogin==null || oldLogin.getPassword().equals(login.getPassword())==false)
            {
                System.out.println(" username did not match");
                return "login/login";
            }
            else
            {
                 System.out.println(oldLogin);
            }
            //form success
           request.getSession().setAttribute(ApplicationConstants.LOGIN_DATA,oldLogin);
           return "common/home";
        }
    }
@RequestMapping(value = "/signup.htm", method = RequestMethod.POST)
    public String processSignupSubmit(@ModelAttribute("login")Login login,
                                BindingResult result,
                                SessionStatus status,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes)
    {
        String target = "login/LoginSuccess";
        loginValidator.validate(login, result);
        if (result.hasErrors()) {
            //if validator failed
        	System.out.println("in processSubmit failured");
//            target = "signup";
            target = "redirect:signup.htm";
        } else {
            status.setComplete();
            System.out.println("in processSubmit success");
            DaoResult daoResult = loginService.saveUser(login);
            if(daoResult.isSuccessful()){
                request.setAttribute("successMsg",daoResult.getMessage());
                request.getSession().setAttribute(ApplicationConstants.LOGIN_DATA,login);
            }else{
                redirectAttributes.addFlashAttribute("errorMsg",daoResult.getMessage());
                redirectAttributes.addFlashAttribute("signup",login);
//                target = "signup";
                target = "redirect:signup.htm";
            }
        }
        System.out.println("target:" + target);
        return target;
    }



}


