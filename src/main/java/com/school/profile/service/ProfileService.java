package com.school.profile.service;

import com.school.login.model.Login;
import com.school.profile.dao.ProfileDAO;
import com.school.profile.model.Profile;
import com.school.profile.service.ProfileService;
import com.school.util.DaoResult;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;


import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 4/25/14.
 */

@Service
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.school.profile.dao")
public class ProfileService {

    @Autowired
    private ProfileDAO profileDAO;

    public ProfileService() {
        super();
    }


    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public DaoResult updateProfile(Profile profile) {
        System.out.println("TransactionSynchronizationManager.isActualTransactionActive():"+ TransactionSynchronizationManager.isActualTransactionActive());
        return profileDAO.updateProfile(profile);

    }

    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public DaoResult updateProfileProperty(String filedName, Object value,Long profileId){
        DaoResult daoResult = new DaoResult();
        try{
            Query query = profileDAO.getQuery(" update " + Profile.class.getSimpleName() + " set " + filedName + "=:field where profileId=:profileId");
            query.setParameter("field", value);
            query.setParameter("profileId", profileId);
            query.executeUpdate();
            return daoResult;
        }catch (Exception e){
            daoResult.setValues(false,e.getLocalizedMessage(),DaoResult.EXCEPTION);
        }
        return daoResult;

    }

    @Transactional
    public List<Profile> getProfiles(String hql, int limit, int offset){
        System.out.println(hql);
        return profileDAO.getQuery(hql).setFirstResult(offset).setMaxResults(limit).list();
    }

    @Transactional(readOnly = false)
    public DaoResult deleteProfile(String profileName) {
        return null;
    }

    @Transactional(readOnly = true)
    public Profile getProfileById(long id) {
        return (Profile)profileDAO.getCriteria(Profile.class).add(Restrictions.eq("userId",id)).uniqueResult();
    }
}
