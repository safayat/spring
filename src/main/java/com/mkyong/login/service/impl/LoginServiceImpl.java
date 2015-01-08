package com.mkyong.login.service.impl;

import java.util.List;

import com.mkyong.login.service.LoginService;
import com.mkyong.profile.model.Profile;
import com.mkyong.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
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
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDAO loginDAO;

    public LoginServiceImpl() {
        super();
    }

    @Override
    public Login findByUserName(String userName) {
        return loginDAO.findUserByUserName(userName);
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
    public DaoResult deleteUser(String userName) {
        /* Login login=loginDAO.findById(userName);
        if(login!=null)
        {
            loginDAO.delete(login);
        }*/
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
}
