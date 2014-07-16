package com.mkyong.user.dao;

import com.mkyong.login.dao.AbstractDAO;
import com.mkyong.user.model.User;
import org.hibernate.criterion.Criterion;

import java.util.List;

/**
 * Created by safayat on 6/5/14.
 */
public interface UserDao extends AbstractDAO<User,String> {

    void saveOrUpdateUser(User user);
    void deleteUser(User user);
    List<User> findUsers(Integer loginId);
}
