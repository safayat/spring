package com.school.login.service;

import java.util.*;

import com.google.common.base.Strings;
import com.school.profile.model.Profile;
import com.school.util.CriteriaContainer;
import com.school.util.DaoResult;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.login.dao.LoginDAO;
import com.school.login.model.Login;

/**
 * Created by safayat on 4/25/14.
 */
@ComponentScan("com.school.login.dao")
@Service
@Transactional(readOnly = true)
public class LoginService{

    @Autowired
    private LoginDAO loginDAO;

    public Login findByUserName(String username) {
        return loginDAO.findUserByUserName(username);
    }

    public Login findById(Integer id) {
        return loginDAO.getById(Login.class, id);
    }

    @Transactional
    public DaoResult saveUser(Login login) {
        Profile profile = new Profile();
        profile.setLogin(login);
        login.setProfile(profile);
        return loginDAO.saveUser(login);
    }

    @Transactional
    public DaoResult updatePassword(int userId, String password) {
        DaoResult daoResult = new DaoResult();
        if(Strings.isNullOrEmpty(password))return daoResult.setValues(false,"",DaoResult.VALIDATION_ERROR);
        try{
            Login login = loginDAO.getById(Login.class,userId);
            login.setPassword(new BCryptPasswordEncoder().encode(password));
        }catch (Exception e){
            daoResult.setValues(false,e.getLocalizedMessage(),DaoResult.EXCEPTION);
        }
        return daoResult;
    }

    @Transactional
    public DaoResult deleteUser(String username) {
        return null;
    }

    @Transactional
    public List<Login> getAllUsers() {
        return loginDAO.getAll(Login.class);
    }

    @Transactional
    public List<Login> getUsersByType(String userType) {
        return loginDAO.getByHql(" from " + Login.class.getSimpleName() + " where userType = '" +userType + "'");
    }

    @Transactional
    public List<Login> getEmployeeUsers() {
        return loginDAO.getByHql(" from " + Login.class.getSimpleName() + " where userType = 'teacher' or userType = 'staff' ");
    }


}
