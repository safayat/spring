package com.mkyong.menu.service;

import com.mkyong.assignment.model.Assignment;
import com.mkyong.menu.dao.MenuDAO;
import com.mkyong.menu.model.Menu;
import com.mkyong.message.dao.MessageDAO;
import com.mkyong.message.model.Message;
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

    @Transactional
    public List<Menu> getAllMenu(){
        return menuDAO.getAllWithOpenSession(Menu.class);
    }

    public List<Menu> getMenuTree(){
        List<Menu> menuTree = new ArrayList<>();
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


}
