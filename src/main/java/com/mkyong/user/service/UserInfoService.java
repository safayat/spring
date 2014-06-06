package com.mkyong.user.service;

import com.mkyong.user.model.User;

import java.util.List;

/**
 * Created by safayat on 6/6/14.
 */

public interface UserInfoService {
    User findByUserName(String userName);
    void saveUser(User user);
    void deleteUser(String userName);
    List<User> findUsers(String user);
}
