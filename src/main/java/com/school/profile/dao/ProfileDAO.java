package com.school.profile.dao;

import com.school.common.dao.impl.CommonDaoImpl;
import com.school.login.model.Login;
import com.school.profile.dao.ProfileDAO;
import com.school.profile.model.Profile;
import com.school.user.model.CommonUser;
import com.school.util.DaoResult;
import com.school.util.Utility;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
@Repository
public class ProfileDAO extends CommonDaoImpl{

    protected ProfileDAO(){
    }

    public DaoResult updateProfile(Profile profile) {
        DaoResult daoResult = new DaoResult();
        try{
            saveOrUpdate(profile);
            Login login = getById(Login.class, profile.getUserId());
            Class clazz = Utility.getUserEntityClass(login.getUserType());
            CommonUser commonUser = (CommonUser)getQuery("from " + clazz.getSimpleName() + " where userId = " + profile.getUserId()).uniqueResult();
            commonUser.setFullName(profile.getFullName());
            daoResult.setValues(true,"Profile updated successfully",DaoResult.DONE);
        }catch (Exception e){
            e.printStackTrace();
            daoResult.setValues(false,e.getMessage(),DaoResult.EXCEPTION);
        }
        return  daoResult;
    }

    public DaoResult deleteProfile(String ProfileName) {
        return null;
    }


}
