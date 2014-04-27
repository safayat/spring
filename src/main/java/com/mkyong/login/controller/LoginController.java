package com.mkyong.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.mkyong.login.model.Login;
import com.mkyong.login.service.UserService;
import com.mkyong.login.validator.LoginValidator;

/**
 * Created by safayat on 4/24/14.
 */

@Controller
@RequestMapping("/login.htm")
/*@Configuration
@ComponentScan("com.mkyong.login.service")*/
public class LoginController {


LoginValidator loginValidator;

   /* @Autowired
    private UserService userService;*/

@Autowired
 public LoginController(LoginValidator loginValidator)
  {
	
	System.out.println("in LoginController contruct");
       this.loginValidator=loginValidator;
  }

/*@Autowired
public LoginController()
{
	
}*/

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
                                BindingResult result, SessionStatus status)
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
            //form success
            return "login/LoginSuccess";
        }

    }





}


