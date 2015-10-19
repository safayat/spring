package com.school.menu.service;

import com.school.assignment.model.Assignment;
import com.school.menu.dao.MenuDAO;
import com.school.menu.model.Menu;
import com.school.message.dao.MessageDAO;
import com.school.message.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class MenuService {
    @Autowired
    MenuDAO menuDAO;
    List<Menu> menuTree;

    @Transactional
    public List<Menu> getAllMenu(){
        return menuDAO.getAllWithOpenSession(Menu.class);
    }

    @Transactional
    public List<Menu> getUserMenu(String userType){
        List<String> query = new ArrayList<>();
        query.add("private/%");
        if(userType.equals("teacher") || userType.equals("admin") ){
            query.add("edu/private/%");
        }
        if(userType.equals("student") || userType.equals("admin")){
            query.add("stu/private/%");
        }
        if(userType.equals("staff") || userType.equals("admin")){
            query.add("stff/private/%");
        }
        List<Menu> menuList = menuDAO.in(Menu.class,"menuPath",query);
        List<Menu> parentList = menuDAO.getByHql(" from " + Menu.class.getSimpleName() + " where parentId = -1");

        return null;
    }

    public List<Menu> getMenuTree(){

        if(menuTree != null)
            return menuTree;
        menuTree = new ArrayList<>();
        List<Menu> allMenu = getAllMenu();
        Map<Integer,Menu> menuMap = new HashMap<>();
        System.out.println(allMenu);

        for(Menu menu : allMenu){
            menuMap.put(menu.getMenuId(), menu);
        }
        for(Menu menu : allMenu){
            if(menu.getParentId() == -1) menuTree.add(menu);
            else{
                Menu childMenu = menuMap.get(menu.getMenuId());
                Menu parentMenu = menuMap.get(childMenu.getParentId());
                List<Menu> childMenuList = parentMenu.getChildMenuList();
                if(childMenuList==null) {
                    childMenuList = new ArrayList<>();
                    parentMenu.setChildMenuList(childMenuList);
                }
                childMenuList.add(childMenu);
            }
        }
        System.out.println(menuTree);
        return  menuTree;
    }

    public Map<Integer,Integer> getPermissionMap(String userType){

        List<Menu> menuList = getMenuTree();
        Map<Integer,Integer> menuMap = new HashMap<>();
        for(Menu menu : menuList){
            if(matchUrl(userType,menu.getMenuPath())){
                menuMap.put(menu.getMenuId(),menu.getMenuId());
            }
            if(menu.getChildMenuList()!=null){
                for(Menu child : menu.getChildMenuList()){
                    if(matchUrl(userType,child.getMenuPath())){
                        menuMap.put(child.getMenuId(),child.getMenuId());
                        if(child.getParentId() != -1){
                            menuMap.put(child.getParentId(),child.getParentId());
                        }

                    }
                }
            }
        }
        System.out.println("menuMap:" + menuMap);
        return  menuMap;
    }

    boolean matchUrl(String userType, String url){
        if(url == null) return false;
        if(url.startsWith("private/")) return true;
        if(url.startsWith("public/")) return true;
        if("admin".equals(userType)){
            if(url.startsWith("admin/private/")) return true;
        }
        if("admin".equals(userType) || "student".equals(userType)){
            if(url.startsWith("stu/private/")) return true;
        }
        if("admin".equals(userType) || "teacher".equals(userType)){
            if(url.startsWith("edu/private/")) return true;
        }
        if("admin".equals(userType) || "staff".equals(userType)){
            if(url.startsWith("stff/private/")) return true;
        }
        return false;
    }


}
