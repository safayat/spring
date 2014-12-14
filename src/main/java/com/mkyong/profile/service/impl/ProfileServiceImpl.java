package com.mkyong.profile.service.impl;

import com.mkyong.profile.dao.ProfileDAO;
import com.mkyong.profile.model.Profile;
import com.mkyong.profile.service.ProfileService;
import com.mkyong.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
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

@Service("profileService")
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.mkyong.profile.dao")
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    private ProfileDAO profileDAO;

    public ProfileServiceImpl() {
        super();
    }


    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public DaoResult updateProfile(Profile profile) {
        System.out.println("TransactionSynchronizationManager.isActualTransactionActive():"+ TransactionSynchronizationManager.isActualTransactionActive());
        return profileDAO.updateProfile(profile);

    }

    @Override
    @Transactional(readOnly = false)
    public DaoResult deleteProfile(String profileName) {
        return null;
    }

    @Override
    @Transactional(readOnly = true)
    public Profile getProfileById(int id) {
        return profileDAO.getProfileById(id);
    }
}
