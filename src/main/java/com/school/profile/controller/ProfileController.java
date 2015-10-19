package com.school.profile.controller;

import com.google.gson.Gson;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import com.school.profile.service.ProfileService;
import com.school.util.ApplicationConstants;
import com.school.util.DaoResult;
import com.school.util.Utility;
import com.mysql.jdbc.StringUtils;
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
        System.out.println("servletContext.getRealPath:" + servletContext.getRealPath("Tourism"));
        System.out.println("servletContext.getRealPath:" + servletContext.getRealPath("webapp"));
        System.out.println("servletContext.getRealPath:" + servletContext.getRealPath(""));
        return "profile/profile";
    }

    @RequestMapping(value = "/private/profileView.web", method = RequestMethod.GET)
    public String profileView(ModelMap map, @RequestParam("profileId")Integer profileId)
    {
        Profile profile = profileService.getProfileById(profileId);
        map.addAttribute("profile",profile);
        System.out.println("p login:" + profile.getLogin());
        return "profile/profileView";
    }

    @RequestMapping(value = "/private/updateProfile.web", method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("profile")Profile profile,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes)
    {
        DaoResult daoResult = profileService.updateProfile(profile);
        return "redirect:profile.web?profileId=" + profile.getProfileId();

    }

    @RequestMapping(value = "/private/uploadProfilePicture.web", method = RequestMethod.POST)
    public String uploadProfilePicture(@RequestParam(value = "profileId", defaultValue = "1",required = false)Integer profileId,
                                       @RequestParam("profileImage")MultipartFile profileImage,
                                        RedirectAttributes redirectAttributes)
    {

        Profile profile = profileService.getProfileById(profileId);
        String contextPath = servletContext.getRealPath("");
        String imagePath = "/images/" + profile.getProfileId() + "_" + System.currentTimeMillis() + ".jpg";

        String uploadPath = contextPath.substring(0,contextPath.indexOf("/SchoolManagement")) + imagePath;
        System.out.println("uploadPath:"  + uploadPath);
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
        return "redirect:profile.web?profileId=" + profileId;

    }






}


