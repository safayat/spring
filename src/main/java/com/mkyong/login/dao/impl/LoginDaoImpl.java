package com.mkyong.login.dao.impl;

import com.mkyong.common.dao.impl.AbstractDaoImpl;
import com.mkyong.login.dao.LoginDAO;
import com.mkyong.login.model.Login;

import com.mkyong.util.DaoResult;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
@Repository
public class LoginDaoImpl extends AbstractDaoImpl<Login,String> implements LoginDAO{

    protected LoginDaoImpl(){
         //super(Login.class);
          setEntityClass(Login.class);
    }

    @Override
    public DaoResult saveUser(Login login) {
        DaoResult daoResult=new DaoResult();
        try{
            Login oldLogin = (Login) findByUniqueCriteria(
                    Restrictions.or(
                            Restrictions.eq("userName", login.getUserName())
                            , Restrictions.eq("email", login.getEmail())));
            if(oldLogin==null){
                saveOrUpdate(login);
                daoResult.setValues(true, "User saved successfully", DaoResult.DONE);
            }else{
                if(oldLogin.getUserName().equals(login.getUserName())){
                    daoResult.setValues(false,"Username already exists", DaoResult.VALIDATION_ERROR);
                }else{
                    daoResult.setValues(false,"Email already exists", DaoResult.VALIDATION_ERROR);
                }
            }
        }catch (Exception e){
            daoResult.setValues(false, e.getMessage(), DaoResult.EXCEPTION);
        }
        return  daoResult;
    }

    @Override
    public List<Login> findUsers() {
        return null;
    }

    @Override
    public Login findUserByUserName(String userName) {
       return (Login)findByUniqueCriteria(Restrictions.eq("userName",userName));
    }
}
