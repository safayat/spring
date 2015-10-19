package com.school.menu.service;

import com.school.menu.dao.MenuDAO;
import com.school.menu.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by safayat on 3/8/15.
 */
public class MenuManager {
    /*@Autowired
    MenuService menuService;
    private static MenuManager menuManager = null;
    List<Menu> menuList;
    private MenuManager() {
        menuList = menuService.getMenuTree();
    }

    public static synchronized void createInstance(){
        if(menuManager == null){
            menuManager = new MenuManager();
        }
    }

    public static MenuManager getInstance(){
        if(menuManager == null){
            createInstance();
        }
        return menuManager;
    }

    public List<Menu> getMenuTree() {
        return menuList;
    }*/
}
