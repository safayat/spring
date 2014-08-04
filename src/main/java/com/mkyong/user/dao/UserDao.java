package com.mkyong.user.dao;

import java.util.List;

import com.mkyong.common.dao.AbstractDAO;
import com.mkyong.user.model.User;

/**
 * Created by safayat on 6/5/14.
 */
public interface UserDao extends AbstractDAO<User,String> {

    void saveOrUpdateUser(User user);
    void deleteUser(User user);
    List<User> findUsers(Integer loginId);
    List<User> findUsers();

}
