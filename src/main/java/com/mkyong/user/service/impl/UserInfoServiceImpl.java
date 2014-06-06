package com.mkyong.user.service.impl;

import com.mkyong.user.dao.UserDao;
import com.mkyong.user.model.User;
import com.mkyong.user.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 6/6/14.
 */
@Service("userService")
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.user.dao")
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserDao userDao;

    @Override
    public User findByUserName(String userName) {
/*
        List userList=userDao.
*/
        return null;
    }

    @Override
    @Transactional
    public void saveUser(User user) {

    }

    @Override
    @Transactional
    public void deleteUser(String userName) {

    }

    @Override
    public List<User> findUsers(String userName) {
        return findUsers(userName);
    }
}
