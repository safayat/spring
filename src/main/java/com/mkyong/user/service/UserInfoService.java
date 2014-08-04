package com.mkyong.user.service;

import com.mkyong.login.model.Login;
import com.mkyong.user.model.User;

import java.util.List;

/**
 * Created by safayat on 6/6/14.
 */

public interface UserInfoService {
    User findByLoginId(Integer loginId);
    void saveUser(User user);
    void deleteUser(String userName);
    List<User> findUsers(String user);
    List<User> findUsers();
    User findById(Integer id);
}
