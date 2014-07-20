package com.mkyong.user.controller;

import com.mkyong.login.service.UserService;
import com.mkyong.user.model.User;
import com.mkyong.user.service.UserInfoService;
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

/**
 * Created by safayat on 4/28/14.
 */

@Controller
@Configuration
@RequestMapping("/userAdd.htm")
@ComponentScan("com.mkyong.user.service")
public class UserController {

    @Autowired
    UserInfoService userInfoService;
    @Autowired
    UserService userService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String userAdd(ModelMap map) {
        System.out.println("in userAdd");
        User user=new User();
        map.addAttribute("user",user);
       return "user/addUser";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String userSave(@ModelAttribute("user")User user,
                           BindingResult result, SessionStatus status) {
        System.out.println("added user:" + user);
        if(userInfoService.findByLoginId(user.getLoginId())==null){
            userInfoService.saveUser(user);
        }

        return "user/addUser";
    }
}
