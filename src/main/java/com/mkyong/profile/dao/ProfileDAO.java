package com.mkyong.profile.dao;

import com.mkyong.common.dao.AbstractDAO;
import com.mkyong.profile.model.Profile;
import com.mkyong.util.DaoResult;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface ProfileDAO extends AbstractDAO<Profile, Integer>{
    DaoResult updateProfile(Profile Profile);
    DaoResult deleteProfile(String ProfileName);
    Profile getProfileById(int id);

}
