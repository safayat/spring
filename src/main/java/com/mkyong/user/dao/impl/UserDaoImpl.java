package com.mkyong.user.dao.impl;

import com.mkyong.common.dao.impl.AbstractDaoImpl;
import com.mkyong.user.dao.UserDao;
import com.mkyong.user.model.User;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

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
        return findByCriteria(Restrictions.like("loginId",String.valueOf(loginId), MatchMode.START));    }

    @Override
    public void saveOrUpdateUser(User user) {
        saveOrUpdate(user);
    }

    @Override
    public void deleteUser(User user) {
        delete(user);
    }
/*@Override
    public List<User> findByCriteria(String loginId) {
        return findByCriteria(Restrictions.like("loginId", loginId, MatchMode.START));
    }*/
}
