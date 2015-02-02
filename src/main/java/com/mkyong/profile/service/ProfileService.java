package com.mkyong.profile.service;

import com.mkyong.profile.dao.ProfileDAO;
import com.mkyong.profile.model.Profile;
import com.mkyong.profile.service.ProfileService;
import com.mkyong.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;


import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */


@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.profile.dao")
public class ProfileService {

    @Autowired
    @Qualifier(value = "profileDAOnew")
    private ProfileDAO profileDAO;

    public ProfileService() {
        super();
    }


    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public DaoResult updateProfile(Profile profile) {
        System.out.println("TransactionSynchronizationManager.isActualTransactionActive():"+ TransactionSynchronizationManager.isActualTransactionActive());
        return profileDAO.updateProfile(profile);

    }

    @Transactional(readOnly = false)
    public DaoResult deleteProfile(String profileName) {
        return null;
    }

    @Transactional(readOnly = true)
    public Profile getProfileById(int id) {
        return profileDAO.getProfileById(id);
    }
}
