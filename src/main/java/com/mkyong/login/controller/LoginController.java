package com.mkyong.login.controller;

import com.mkyong.util.ApplicationConstants;
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
import com.mkyong.login.service.UserService;
import com.mkyong.login.validator.LoginValidator;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller

@Configuration
@RequestMapping("/login.htm")
@ComponentScan("com.mkyong.login.service")
public class LoginController {

@Autowired
LoginValidator loginValidator;

   @Autowired
    private UserService userService;



    @RequestMapping(method = RequestMethod.GET)
    public String initForm(ModelMap map)
    {
       Login login=new Login("");
        System.out.println("in get method of"+ this.getClass().getCanonicalName());
        map.addAttribute("login",login);
       return "login/login";
    }



    @RequestMapping(method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("login")Login login,
                                BindingResult result, SessionStatus status,HttpServletRequest request)
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
            Login oldLogin=userService.findByUserName(login.getUserName());
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
           request.getSession().setAttribute(ApplicationConstants.LOGIN_DATA,login);
           return "login/LoginSuccess";
        }
    }

    /*@RequestMapping(value = "/logout.htm",method = RequestMethod.GET)
    public String logOut(ModelMap map){

        return "login/login";
    }
*/


}


