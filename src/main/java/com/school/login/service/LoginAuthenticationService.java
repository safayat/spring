package com.school.login.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.school.global.controller.GlobalController;
import com.school.login.dao.LoginDAO;
import com.school.login.model.Login;
import com.school.menu.dao.MenuDAO;
import com.school.menu.model.Menu;
import com.school.menu.service.MenuService;
import com.school.profile.model.Profile;
import com.school.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.*;

/**
 * Created by safayat on 4/25/14.
 */
@Configuration
public class LoginAuthenticationService implements UserDetailsService{

    @Autowired
    private LoginDAO loginDAO;
    @Autowired
    private MenuService menuService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetails userDetails = null;
        try{
            Login login = loginDAO.findUserByUserName(username);

            ObjectMapper mapper = new ObjectMapper();
            String loginInfo = null;
            login.setPermissionMap(menuService.getPermissionMap(login.getUserType()));
            loginInfo = mapper.writeValueAsString(login);
            userDetails = new User(loginInfo, login.getPassword(), true, true, true, true, buildAuthority(login.getUserType()));

        }catch (Exception e){
            e.printStackTrace();
        }
        return userDetails;
    }

    public List <GrantedAuthority> buildAuthority(String userType){
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
        setAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
        if(userType.equals("admin")){
            setAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
            setAuths.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
            setAuths.add(new SimpleGrantedAuthority("ROLE_TEACHER"));
            setAuths.add(new SimpleGrantedAuthority("ROLE_STAFF"));
            setAuths.add(new SimpleGrantedAuthority("ROLE_GUARDIAN"));
        }else if(userType.equals("student")){
            setAuths.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
        }else if(userType.equals("teacher")){
            setAuths.add(new SimpleGrantedAuthority("ROLE_TEACHER"));
        }else if(userType.equals("staff")){
            setAuths.add(new SimpleGrantedAuthority("ROLE_STAFF"));
        }else if(userType.equals("guardian")){
            setAuths.add(new SimpleGrantedAuthority("ROLE_GUARDIAN"));
        }
        return  new ArrayList<>(setAuths);

    }


}
