package com.mkyong.user.dao.impl;

import com.mkyong.common.dao.impl.AbstractDaoImpl;
import com.mkyong.user.dao.UserDao;
import com.mkyong.user.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by safayat on 6/5/14.
 */
@Repository
public class UserDaoImpl extends AbstractDaoImpl<User,String> implements UserDao {
    @Override
    public User findById(Long id) {
        return null;
    }

    @Override
    public void saveOrUpdate(User user) {

    }

    @Override
    public void delete(User user) {

    }

    @Override
    public User findById(String id) {
        return null;
    }
}
