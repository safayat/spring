package com.school.user.service;

import com.google.common.base.Strings;
import com.school.clazz.model.Clazz;
import com.school.common.dao.CommonDAO;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import com.school.user.dao.UserDAO;
import com.school.user.model.*;
import com.school.util.DaoResult;
import com.school.util.Utility;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 2/3/15.
 */


@Service
@Transactional(readOnly = true)
@Configuration
@ComponentScan("com.school.user.dao")

public class UserService {
    @Autowired
    UserDAO userDAO;

    @Autowired
    CommonDAO commonDAO;

    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public void saveOrUpdate(CommonUser user) throws Exception{

        Profile profile = (Profile)userDAO.getQuery("from " + Profile.class.getSimpleName() +  " where userId=" + user.getUserId()).uniqueResult();
        user.setProfileId(profile.getProfileId());
        user.setFullName(profile.getFirstName() + " " + profile.getLastName());
        userDAO.saveOrUpdate(user);
    }

    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public Long createUser(CommonUser user) throws Exception{
        Login login = user.getLogin();
        login.setPassword(new BCryptPasswordEncoder().encode(login.getPassword()));
        if(Strings.isNullOrEmpty(login.getEmail())){
            login.setEmail(login.getUsername() + "_" + System.currentTimeMillis() + "@school.com");
        }
        userDAO.saveOrUpdate(login);

        Profile profile = user.getProfile();
        profile.setProfileImageUrl("image/Default_Profile_Picture.png");
        profile.setUserId(login.getUserId());
        userDAO.saveOrUpdate(profile);

        user.setProfileId(profile.getProfileId());
        user.setUserId(login.getUserId());
        userDAO.saveOrUpdate(user);
        return user.getUserId();
    }

    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public DaoResult update(CommonUser user){
        DaoResult daoResult = new DaoResult();
        try{
            userDAO.saveOrUpdate(user);
            daoResult.setValues(true,"", DaoResult.DONE);
        }catch (Exception e){
            e.printStackTrace();
            daoResult.setValues(true,e.getMessage(), DaoResult.EXCEPTION);
        }
        return daoResult;
    }

    @Transactional(readOnly = false)
    public List<CommonUser> getUserList(Class entityClass){
        return userDAO.getAll(entityClass);
    }
    @Transactional(readOnly = false)
    public List<CommonUser> getDetailUserList(Class entityClass){
        List<CommonUser> list = userDAO.getAll(entityClass);
        loadUserProfiles(list);
        loadUserLoginInfos(list);
        return list;
    }

    @Transactional(readOnly = false)
    public List<CommonUser> getDetailUserList(Class entityClass, List<Criterion> criterionList,int offset,int limit){
        List<CommonUser> list = userDAO.getPaginatedData(entityClass, criterionList, offset, limit);
        loadUserProfiles(list);
        loadUserLoginInfos(list);
        return list;
    }

    @Transactional(readOnly = false)
    public Teacher getTeacherByUserId(Long id){
        try{
            return userDAO.getUniqueByHql("from " + Teacher.class.getSimpleName() + " where userId = " + id);
        }catch (Exception e){

        }

        return null;
    }

    @Transactional(readOnly = false)
    public <I extends CommonUser, K extends Serializable> I getUser(Class<I> entityClass,  K primaryKey){

        try{
            CommonUser commonUser = commonDAO.getById(entityClass, primaryKey);
            loadUserDeatil(commonUser);
            return (I)commonUser;
        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }

    public CommonUser getUserByUserId(long id, Class clazz){
        CommonUser commonUser = null;
        try {
            Login login = commonDAO.getById(Login.class,id);
            commonUser = commonDAO.getUniqueByHql("from " + clazz.getSimpleName() + " where userId = " + id);
            Profile profile = commonDAO.getById(Profile.class, commonUser.getProfileId());
            commonUser.setLogin(login);
            commonUser.setProfile(profile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commonUser;
    }

    public CommonUser getUserByUserId(long id){
        CommonUser commonUser = null;
        try {
            Login login = commonDAO.getById(Login.class,id);
            Class entityClass = Utility.getUserEntityClass(login.getUserType());
            if(entityClass == UserAdmin.class){
                commonUser = new UserAdmin();
            }else{
                commonUser = commonDAO.getUniqueByHql("from " + entityClass.getSimpleName() + " where userId = " + id);
            }
            Profile profile = commonDAO.getUniqueByHql("from " + Profile.class.getSimpleName() + " where userId = " + id);
            commonUser.setLogin(login);
            commonUser.setProfile(profile);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return commonUser;
    }

    public CommonUser get(Integer userSpecificId, Class clazz){
        return userDAO.getById(clazz,userSpecificId);
    }


    @Transactional(readOnly = false)
    public void loadUserProfiles(List<CommonUser> userList){
        List<Long> profileIdList = new ArrayList<>();
        for(CommonUser user : userList){
            profileIdList.add(user.getProfileId());
        }
        System.out.println(profileIdList);
        List<Profile> profileList = commonDAO.in(Profile.class,"profileId",profileIdList);
        System.out.println(profileList.size());
        Map<Long,Profile> profileMap = new HashMap<>();
        for(Profile profile : profileList){
            profileMap.put(profile.getProfileId(), profile);
        }
        for(CommonUser user : userList){
            user.setProfile(profileMap.get(user.getProfileId()));
        }

    }

    @Transactional(readOnly = false)
    public void loadUserLoginInfos(List<CommonUser> userList){
        List<Long> loginIdList = new ArrayList<>();
        for(CommonUser user : userList){
            loginIdList.add(user.getUserId());
        }
        List<Login> loginList = commonDAO.in(Login.class,"userId",loginIdList);
        Map<Long,Login> loginMap = new HashMap<>();
        for(Login login : loginList){
            loginMap.put(login.getUserId(), login);
        }
        for(CommonUser user : userList){
            user.setLogin(loginMap.get(user.getUserId()));
        }
    }

    @Transactional(readOnly = false)
    public void loadUserDeatil(CommonUser user){
        user.setLogin((Login)commonDAO.getById(Login.class, user.getUserId()));
        user.setProfile((Profile)commonDAO.getById(Profile.class, user.getProfileId()));
    }



}
