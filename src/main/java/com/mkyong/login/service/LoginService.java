package com.mkyong.login.service;

/**
 * Created by safayat on 4/25/14.
 */
import com.mkyong.login.model.Login;
import com.mkyong.util.DaoResult;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface LoginService {
    Login findByUserName(String userName);
    DaoResult saveUser(Login login);
    DaoResult deleteUser(String userName);
    List<Login> findUsers(String user);
    List<Login> getAllUsers();
}
