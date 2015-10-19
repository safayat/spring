package com.school.menu.controller;

import com.school.clazz.service.ClazzService;
import com.school.course.model.Course;
import com.school.course.model.CourseRoutine;
import com.school.course.service.CourseService;
import com.school.menu.model.Menu;
import com.school.menu.service.MenuService;
import com.school.user.model.Teacher;
import com.school.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
/**
 * Created by safayat on 2/3/15.
 */


@Controller
@RequestMapping(value = "private/userManagement.web")
public class MenuController {

   /* @Autowired
    MenuService menuService;*/

    @ModelAttribute(value = "menuTree")
    public List<Menu> getMenu()
    {
        System.out.println("ControllerAdvice worked");
//        return menuService.getMenuTree();
        return null;
    }
}
