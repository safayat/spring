package com.mkyong.user.service;

import com.mkyong.login.model.Login;
import com.mkyong.profile.model.Profile;
import com.mkyong.user.dao.UserDAO;
import com.mkyong.user.model.CommonUser;
import com.mkyong.user.model.Teacher;
import com.mkyong.util.DaoResult;
import com.mkyong.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */


@Service
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.user.dao")

public class UserService {
    @Autowired
    UserDAO userDAO;

    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public DaoResult saveOrUpdate(CommonUser user){
        DaoResult daoResult = new DaoResult();
        try{
            Login login = user.getLogin();
            Profile profile = new Profile();
            profile.setLogin(login);
            login.setProfile(profile);
            login.setPassword(new BCryptPasswordEncoder().encode(login.getPassword()));
            userDAO.saveOrUpdate(login);
            user.setId(login.getUserId());
            userDAO.saveOrUpdate(user);
            daoResult.setValues(true,"", DaoResult.DONE);
        }catch (Exception e){
            e.printStackTrace();
            daoResult.setValues(true,e.getMessage(), DaoResult.EXCEPTION);
        }
        return daoResult;
    }

    public List<CommonUser> getUserList(Class entityClass){
        return userDAO.getAll(entityClass);
    }

    public Teacher getTeacherByUserId(Integer id){
        try{
            return userDAO.getUniqueByHql("from " + Teacher.class.getSimpleName() + " where userId = " + id);
        }catch (Exception e){

        }

        return null;
    }

}
