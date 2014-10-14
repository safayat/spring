package com.mkyong.profile.service;

/**
 * Created by safayat on 4/25/14.
 */
import com.mkyong.profile.model.Profile;
import com.mkyong.util.DaoResult;

import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface ProfileService {
    DaoResult updateProfile(Profile profile);
    DaoResult deleteProfile(String profileName);
    Profile getProfileById(int id);
}
