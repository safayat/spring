package com.mkyong.login.service;

/**
 * Created by safayat on 4/25/14.
 */
import com.mkyong.login.model.Login;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface UserService {
    Login findByUserName(String userName);
    void saveUser(Login login);
    void deleteUser(String userName);
    List<Login> findUsers(String user);
}
