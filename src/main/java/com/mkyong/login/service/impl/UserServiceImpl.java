package com.mkyong.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkyong.login.dao.LoginDAO;
import com.mkyong.login.model.Login;
import com.mkyong.login.service.UserService;

/**
 * Created by safayat on 4/25/14.
 */

@Service("userService")
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.login.dao")
public class UserServiceImpl implements UserService{

    @Autowired
    private LoginDAO loginDAO;

    public UserServiceImpl() {
        super();
    }

    @Override
    public Login findByUserName(String userName) {
        List list= loginDAO.findUsers(userName);
        if(list!=null && list.size()==1)
        {
            return (Login)list.get(0);
        }
        else
          return null;
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
        return loginDAO.findUsers(user);
    }
}
