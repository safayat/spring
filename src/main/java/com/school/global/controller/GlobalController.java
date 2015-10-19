package com.school.global.controller;

import com.school.clazz.model.Clazz;
import com.school.clazz.service.ClazzService;
import com.school.login.model.Login;
import com.school.menu.model.Menu;
import com.school.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by safayat on 2/3/15.
 */

@Controller
@ControllerAdvice
@ComponentScan("com.school.menu.service")
public class GlobalController {

   @Autowired
   MenuService menuService;
   @Autowired
   ClazzService clazzService;

   Map<Integer,String> menuIconMap;
   Map<String,String[]> menuUrlMap;

    public GlobalController() {
        menuIconMap = new HashMap();
        menuIconMap.put(1,"fa fa-user");
        menuIconMap.put(5,"fa fa-group");
        menuIconMap.put(8,"fa fa-book");
        menuIconMap.put(11,"fa fa-archive");
        menuIconMap.put(13,"fa fa-asterisk");
        menuIconMap.put(14,"fa fa-clock-o");
        menuIconMap.put(20,"fa fa-home");
        menuIconMap.put(24,"fa fa-calendar");
        menuIconMap.put(24,"fa fa-calendar");
        menuIconMap.put(27,"fa fa-money");
        menuIconMap.put(31,"fa fa-plus");
        menuIconMap.put(35,"fa fa-picture-o");
        menuIconMap.put(36,"fa fa-picture-o");
        menuIconMap.put(37,"fa fa-download");
        menuIconMap.put(38,"fa fa-newspaper-o");


        menuUrlMap = new HashMap<>();
        String[] teacherMap ={"private/","edu/private/"};
        String[] studentMap ={"private/,stu/private/"};
        String[] staffMap ={"private/","stff/private/"};
        String[] adminMap ={"private/","edu/private/","stu/private/","stff/private/"};
        menuUrlMap.put("teacher",teacherMap);
        menuUrlMap.put("student",studentMap);
        menuUrlMap.put("staff",staffMap);
        menuUrlMap.put("admin",adminMap);
    }

    @RequestMapping(value = "/private/init.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    String getInitApp()
    {
        menuService.getMenuTree();
        return "success";
    }

    @ModelAttribute(value = "menuTree")
    public List<Menu> getMenuTree()
    {
        return menuService.getMenuTree();
    }


    @ModelAttribute(value = "menuIconMap")
    public Map getMenuIconMap()
    {
        return menuIconMap;
    }

    @ModelAttribute(value = "menuUrlMap")
    public Map getMenuUrlMap()
    {
        return menuUrlMap;
    }

    @ModelAttribute(value = "currentClazzMap")
    public Map getCurrentClazzMap()
    {
        List<Clazz> clazzList = clazzService.getClassListWithOpenSession();
        Map<Integer,String> currentClazzMap = new HashMap();
        for(Clazz clazz : clazzList){
            currentClazzMap.put(clazz.getClassId(), clazz.getClassName());
        }
        return  currentClazzMap;
    }

    @ModelAttribute(value = "loginInfo")
    public Login getLoginInfo(Principal principal)
    {
        System.out.println(principal);
        if(principal == null) return null;
        return Login.getLoginFromPrincipal(principal.getName());
    }
}
