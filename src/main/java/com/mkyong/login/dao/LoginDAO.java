package com.mkyong.login.dao;

import com.mkyong.login.model.Login;
import com.mkyong.common.dao.AbstractDAO;
import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface LoginDAO extends AbstractDAO<Login, String>{
    void saveUser(Login login);
    List<Login> findUsers();
    public Login findUserByUserName(String userName);

}
