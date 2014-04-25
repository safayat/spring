package com.mkyong.login.service.impl;

import com.mkyong.login.dao.LoginDAO;
import com.mkyong.login.model.Login;
import com.mkyong.login.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */

@Service("userService")
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService{

    @Autowired
    private LoginDAO loginDAO;

    public UserServiceImpl() {
        super();
    }

    @Override
    public Login findByUserName(String userName) {
        return loginDAO.findById(userName);
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
