package com.mkyong.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkyong.user.dao.UserDao;
import com.mkyong.user.model.User;
import com.mkyong.user.service.UserInfoService;

/**
 * Created by safayat on 6/6/14.
 */
@Service("userService2")
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.user.dao")
public class UserInfoServiceImpl implements UserInfoService {



    @Autowired
    UserDao userDao;

    @Override
    public User findById(Integer id) {
        return userDao.findById(String.valueOf(id));
    }

    @Override
    public User findByLoginId(Integer id) {
//        return userDao.findUsers(id).get(0);
          List<User> userList = userDao.findUsers(id);
          if(userList.size()>0){
              return userList.get(0);
          }
        return null;

    }

    @Override
    @Transactional
    public void saveUser(User user) {
        userDao.saveOrUpdateUser(user);
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
