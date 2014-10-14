package com.mkyong.profile.dao.impl;

import com.mkyong.common.dao.impl.AbstractDaoImpl;
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
public class ProfileDaoImpl extends AbstractDaoImpl<Profile, Integer> implements ProfileDAO {

    protected ProfileDaoImpl(){
         //super(Profile.class);
          setEntityClass(Profile.class);
    }

    @Override
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

    @Override
    public DaoResult deleteProfile(String ProfileName) {
        return null;
    }

    @Override
    public Profile getProfileById(int id) {
        return findById(id);
    }

}
