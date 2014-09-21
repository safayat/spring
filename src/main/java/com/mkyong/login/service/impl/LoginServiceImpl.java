package com.mkyong.login.service.impl;

import java.util.List;

import com.mkyong.login.service.LoginService;
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
    public void saveUser(Login login) {
        loginDAO.saveUser(login);
    }

    @Override
    @Transactional
    public void deleteUser(String userName) {
         Login login=loginDAO.findById(userName);
        if(login!=null)
        {
            loginDAO.delete(login);
        }
    }

    @Override
    public List<Login> findUsers(String user) {
        return null;
    }
}
