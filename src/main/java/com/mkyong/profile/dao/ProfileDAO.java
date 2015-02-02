package com.mkyong.profile.dao;

import com.mkyong.common.dao.impl.AbstractDaoImpl;
import com.mkyong.common.dao.impl.CommonDaoImpl;
import com.mkyong.profile.dao.ProfileDAO;
import com.mkyong.profile.model.Profile;
import com.mkyong.util.DaoResult;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
@Repository
public class ProfileDAO extends CommonDaoImpl<Profile, Integer> {

    protected ProfileDAO(){
        //super(Profile.class);
        setEntityClass(Profile.class);
    }

    public DaoResult updateProfile(Profile profile) {
        DaoResult daoResult = new DaoResult();
        try{
            saveOrUpdate(profile);
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

    public Profile getProfileById(int id) {
        return getById(id);
    }

}
