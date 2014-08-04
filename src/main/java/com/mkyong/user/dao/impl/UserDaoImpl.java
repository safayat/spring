package com.mkyong.user.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mkyong.common.dao.impl.AbstractDaoImpl;
import com.mkyong.user.dao.UserDao;
import com.mkyong.user.model.User;

/**
 * Created by safayat on 6/5/14.
 */
@Repository
public class UserDaoImpl extends AbstractDaoImpl<User,String> implements UserDao {
    public UserDaoImpl() {
        setEntityClass(User.class);
    }

    @Override
    public List<User> findUsers(Integer loginId) {
        return findByCriteria(Restrictions.eq("loginId",loginId));    
    }
    @Override
    public List<User> findUsers() {
        return findByCriteria(Restrictions.gt("userInfoId",0));
    }


    @Override
    public void saveOrUpdateUser(User user) {
        saveOrUpdate(user);
    }

    @Override
    public void deleteUser(User user) {
        delete(user);
    }
    

}
