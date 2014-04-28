package com.mkyong.login.dao.impl;

import com.mkyong.login.dao.LoginDAO;
import com.mkyong.login.model.Login;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
@Repository
public class LoginDaoImpl extends AbstractDaoImpl<Login,String> implements LoginDAO{

    protected LoginDaoImpl()
    {
         //super(Login.class);
          setEntityClass(Login.class);
    }



    @Override
    public void saveUser(Login login) {

    }

    @Override
    public List<Login> findUsers(String userName) {
       return findByCriteria(Restrictions.like("userName", userName, MatchMode.START));

    }
}
