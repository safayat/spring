package com.mkyong.login.service.impl;

import java.util.*;

import com.mkyong.login.service.LoginService;
import com.mkyong.profile.model.Profile;
import com.mkyong.util.DaoResult;
import org.codehaus.jackson.map.ObjectMapper;
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

import com.mkyong.login.dao.LoginDAO;
import com.mkyong.login.model.Login;

/**
 * Created by safayat on 4/25/14.
 */

@Service("loginService")
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.login.dao")
public class LoginServiceImpl implements LoginService,UserDetailsService{

    @Autowired
    private LoginDAO loginDAO;

    public LoginServiceImpl() {
        super();
    }

    @Override
    public Login findByUserName(String username) {
        return loginDAO.findUserByUserName(username);
    }

    @Override
    @Transactional
    public DaoResult saveUser(Login login) {
        Profile profile = new Profile();
        profile.setLogin(login);
        login.setProfile(profile);
        return loginDAO.saveUser(login);
    }

    @Override
    @Transactional
    public DaoResult deleteUser(String username) {
        return null;
    }

    @Override
    public List<Login> getAllUsers() {
        return loginDAO.getAll();
    }

    @Override
    public List<Login> findUsers(String user) {
        return loginDAO.findUsers();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Login login = loginDAO.findUserByUserName(username);
        System.out.println("login:"+login);
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
        setAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
        List <GrantedAuthority> authorities = new ArrayList<>(setAuths);
        ObjectMapper mapper = new ObjectMapper();
        String loginInfo = null;
        try{
            loginInfo = mapper.writeValueAsString(login);
        }catch (Exception e){

        }
        UserDetails userDetails = new User(loginInfo, login.getPassword(), true, true, true, true, authorities);
        return userDetails;
    }


}
