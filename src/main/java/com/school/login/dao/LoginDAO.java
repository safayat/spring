package com.school.login.dao;

import com.school.common.dao.impl.CommonDaoImpl;
import com.school.login.dao.LoginDAO;
import com.school.login.model.Login;

import com.school.util.DaoResult;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
@Repository
public class LoginDAO extends CommonDaoImpl{

    public LoginDAO(){
    }

    public DaoResult saveUser(Login login) {
        DaoResult daoResult=new DaoResult();
        try{
            Login oldLogin = (Login) findByUniqueCriteria(Login.class,
                    Restrictions.or(
                            Restrictions.eq("username", login.getUsername())
                            , Restrictions.eq("email", login.getEmail())));
            if(oldLogin==null){
                saveOrUpdate(login);
                daoResult.setValues(true, "User saved successfully", DaoResult.DONE);
            }else{
                if(oldLogin.getUsername().equals(login.getUsername())){
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

    public Login findUserByUserName(String username) {
        return (Login)findByUniqueCriteria(Login.class, Restrictions.eq("username",username));
    }




}
