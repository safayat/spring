package com.mkyong.profile.controller;

import com.mkyong.login.model.Login;
import com.mkyong.profile.model.Profile;
import com.mkyong.profile.service.ProfileService;
import com.mkyong.util.ApplicationConstants;
import com.mkyong.util.DaoResult;
import com.mkyong.util.Utility;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller

@Configuration
@ComponentScan("com.mkyong.profile.service")
public class ProfileController {


    @Qualifier("profileService")
    @Autowired
    private ProfileService profileService;

    @RequestMapping(value = "/private/profile.web", method = RequestMethod.GET)
    public String initForm(ModelMap map, HttpServletRequest request)
    {
        Integer id = (Integer)request.getSession().getAttribute("LOGIN_ID");
        System.out.println("id:" + id);
        Profile profile = profileService.getProfileById(id);
        if(profile == null){
            map.addAttribute("errorMsg","Authentication error");
            return "common/error";
        }
        map.addAttribute("profile",profile);
        return "profile/profile";
    }

    @RequestMapping(value = "/private/updateProfile.web", method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("profile")Profile profile,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes)
    {
        DaoResult daoResult = profileService.updateProfile(profile);
        return "redirect:profile.web?profileId=" + profile.getProfileId();

    }






}


