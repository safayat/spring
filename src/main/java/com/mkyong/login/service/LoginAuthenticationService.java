package com.mkyong.login.service;

import com.mkyong.login.dao.LoginDAO;
import com.mkyong.login.model.Login;
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

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by safayat on 4/25/14.
 */
@Configuration
public class LoginAuthenticationService implements UserDetailsService{

    @Autowired
    private LoginDAO loginDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetails userDetails = null;
        try{
            Login login = loginDAO.findUserByUserName(username);
            ObjectMapper mapper = new ObjectMapper();
            String loginInfo = null;
            login.setProfile(null);
            loginInfo = mapper.writeValueAsString(login);
            userDetails = new User(loginInfo, login.getPassword(), true, true, true, true, buildAuthority());

        }catch (Exception e){

        }
        return userDetails;
    }

    public List <GrantedAuthority> buildAuthority(){
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
        setAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
        return  new ArrayList<>(setAuths);

    }


}
