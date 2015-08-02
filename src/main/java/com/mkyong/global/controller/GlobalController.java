package com.mkyong.global.controller;

import com.mkyong.clazz.model.Clazz;
import com.mkyong.login.model.Login;
import com.mkyong.menu.model.Menu;
import com.mkyong.menu.service.MenuService;
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
@ComponentScan("com.mkyong.menu.service")
public class GlobalController {

   @Autowired
   MenuService menuService;

    List<Menu> menuTree;


    @RequestMapping(value = "/private/init.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    String getInitApp()
    {
        menuTree = menuService.getMenuTree();
        return "success";
    }

    @ModelAttribute(value = "menuTree")
    public List<Menu> getMenuTree()
    {
        if(menuTree == null)
            menuTree = menuService.getMenuTree();
        return menuTree;


    }

    @ModelAttribute(value = "menuIconMap")
    public Map getMenuIconMap()
    {
        Map<Integer,String> menuIconMap = new HashMap();
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
        return menuIconMap;
    }

    @ModelAttribute(value = "currentClazzMap")
    public Map getCurrentClazzMap()
    {
        Map<Integer,String> currentClazzMap = new HashMap();
        currentClazzMap.put(1,"Class 1");
        currentClazzMap.put(2,"Class 2");
        currentClazzMap.put(3,"Class 3");
        currentClazzMap.put(4,"Class 4");
        currentClazzMap.put(5,"Class 5");
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
