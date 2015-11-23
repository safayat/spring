package com.school.profile.controller;

import com.google.common.base.Strings;
import com.google.gson.Gson;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import com.school.profile.service.ProfileService;
import com.school.user.model.Teacher;
import com.school.util.*;
import com.mysql.jdbc.StringUtils;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller
@ComponentScan("com.school.profile.service")
public class ProfileController {



    @Autowired
    private ProfileService profileService;

    @Autowired
    ServletContext servletContext;

    @RequestMapping(value = "/private/profile.web", method = RequestMethod.GET)
    public String initForm(ModelMap map, Principal principal)
    {
        System.out.println("principal.getName():"+principal.getName());
        Profile profile = profileService.getProfileById(new Gson().fromJson(principal.getName(), Login.class).getUserId());
        if(profile == null){
            map.addAttribute("errorMsg","Authentication error");
            return "common/error";
        }
        map.addAttribute("profile",profile);
        return "profile/profile";
    }

    @RequestMapping(value = "/private/profileInfo.web", method = RequestMethod.GET)
    public String profile(@RequestParam(value = "userId")Long userId)
    {
        return "profile/profile_angular";
    }

    @RequestMapping(value = "/private/profileView.web", method = RequestMethod.GET)
    public String profileView(ModelMap map, @RequestParam("userId")Long profileId)
    {
        Profile profile = profileService.getProfileById(profileId);
        map.addAttribute("profile",profile);
        return "profile/profileView";
    }

    @RequestMapping(value = "/private/updateProfile.web", method = RequestMethod.POST)
    @ResponseBody
    public DaoResult processSubmit(@ModelAttribute("profile")Profile profile)
    {
        DaoResult daoResult = profileService.updateProfile(profile);
        return daoResult;

    }

    @RequestMapping(value = "/private/update/single.web", method = RequestMethod.POST)
    @ResponseBody
    public DaoResult updateSingle(@RequestParam("profileId")Long profileId,@RequestParam("fieldName")String fieldName,@RequestParam("value")String value,@RequestParam(value = "fieldtype", required = false)String fieldtype)
    {
        return profileService.updateProfileProperty(fieldName, Utility.getStringToPreferredObject(value,fieldtype), profileId);
    }

    @RequestMapping(value = "/private/uploadProfilePicture.web", method = RequestMethod.POST)
    public String uploadProfilePicture(@RequestParam(value = "profileId", defaultValue = "1",required = false)Integer profileId,
                                       @RequestParam("profileImage")MultipartFile profileImage,
                                        RedirectAttributes redirectAttributes)
    {

        Profile profile = profileService.getProfileById(profileId);
        String contextPath = servletContext.getRealPath("");
        String imagePath = "/images/" + profile.getProfileId() + "_" + System.currentTimeMillis() + ".jpg";

        System.out.println("contextPath:" + contextPath);
        System.out.println(servletContext.getContextPath());
        String uploadPath = contextPath.substring(0,contextPath.indexOf(servletContext.getContextPath())) + imagePath;
        if (!profileImage.isEmpty()) {
            try {
                byte[] bytes = profileImage.getBytes();

                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(uploadPath)));
                stream.write(bytes);
                stream.close();
                profile.setProfileImageUrl(imagePath);
                profileService.updateProfile(profile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        return "redirect:/profileInfo.web?userId=" + profile.getUserId();

    }

    @RequestMapping(value = "/private/getUsers.web", method = RequestMethod.GET)
    public @ResponseBody
    List getTeacherList(@RequestParam(value = "firstName", required = false)String  firstName
            , @RequestParam(value = "lastName", required = false)String lastName
            , @RequestParam(value = "username", required = false)String username
            , @RequestParam(value = "email", required = false)String email
            , @RequestParam(value = "userType", required = false)String userType
            , @RequestParam(value = "mobileNo", required = false)String mobileNo
            , @RequestParam(value = "offset", required = false)int offset
            , @RequestParam(value = "limit", required = false)int limit

    ){
        if(limit <= 0){
            limit = 10;
        }
        if(offset<0)
            offset = 0;
        StringBuilder hql = new StringBuilder();
        hql.append("from " + Profile.class.getSimpleName()+ " p," + Login.class.getSimpleName() + " l where l.userId = p.userId");
        if(StringUtility.notEmpty(username)){
            hql.append(" and l.username = " + StringUtility.toQoute(username));
        }
        if(StringUtility.notEmpty(email)){
            hql.append(" and l.email = " + StringUtility.toQoute(email));
        }

        if(StringUtility.notEmpty(userType)){
            hql.append(" and l.userType = " + StringUtility.toQoute(userType));
        }

        if(StringUtility.notEmpty(firstName)){
            hql.append(" and p.firstName like " + StringUtility.toQoute(firstName + "%"));
        }

        if(StringUtility.notEmpty(lastName)){
            hql.append(" and p.lastName like " + StringUtility.toQoute(lastName) + "%");
        }
        if(StringUtility.notEmpty(mobileNo)){
            hql.append(" and p.mobileNo = " + StringUtility.toQoute(mobileNo));
        }

        return profileService.getProfiles(hql.toString(),limit,offset);

    }

}


