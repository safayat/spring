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
    Login findByUserName(String username);
    DaoResult saveUser(Login login);
    DaoResult deleteUser(String username);
    List<Login> findUsers(String user);
    List<Login> getAllUsers();
}
