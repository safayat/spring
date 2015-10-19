package com.school.menu.model;


import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by safayat on 2/1/15.
 *
 CREATE TABLE `menu` (
 `menuId` int(11) NOT NULL,
 `menuName` varchar(64) NOT NULL,
 `menuPath` varchar(256) DEFAULT NULL,
 `parentId` int(11) DEFAULT '-1',
 PRIMARY KEY (`menuId`)
 )
 */
@Entity
@Table(name = "menu")
public class Menu {
    private Integer menuId;
    private Integer parentId;
    private String menuName;
    private String menuPath;
    private List<Menu> childMenuList;

    @Id
    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuPath() {
        return menuPath;
    }

    public void setMenuPath(String menuPath) {
        this.menuPath = menuPath;
    }

    @Transient
    public List<Menu> getChildMenuList() {
        return childMenuList;
    }

    public void setChildMenuList(List<Menu> childMenuList) {
        this.childMenuList = childMenuList;
    }


    @Override
    public String toString() {
        return "Menu{" +
                "menuId=" + menuId +
                ", parentId=" + parentId +
                ", menuName='" + menuName + '\'' +
                ", menuPath='" + menuPath + '\'' +
                ", childMenuList=" + childMenuList +
                '}';
    }
}
