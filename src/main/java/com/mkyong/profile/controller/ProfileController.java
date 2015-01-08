package com.mkyong.profile.controller;

import com.mkyong.login.model.Login;
import com.mkyong.profile.model.Profile;
import com.mkyong.profile.service.ProfileService;
import com.mkyong.util.ApplicationConstants;
import com.mkyong.util.DaoResult;
import com.mkyong.util.Utility;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller

@Configuration
@ComponentScan("com.mkyong.profile.service")
public class ProfileController {


   @Autowired
    private ProfileService profileService;

    @RequestMapping(value = "/profile.htm", method = RequestMethod.GET)
    public String initForm(ModelMap map, HttpServletRequest request)
    {
        if(!Utility.validateSession(request)){
            return "redirect:login.htm";
        }

        String id = (String)request.getParameter("profileId");
        Login login = (Login) request.getSession().getAttribute(ApplicationConstants.LOGIN_DATA);
        if(!StringUtils.isNullOrEmpty(id)){
            Profile profile = profileService.getProfileById(Integer.parseInt(id));
            if(profile.getProfileId() != login.getUserId()){
                map.addAttribute("errorMsg","Authentication error");
                return "common/error";
            }
            map.addAttribute("profile",profile);
        }
        return "profile/profile";
    }

    @RequestMapping(value = "/updateProfile.htm", method = RequestMethod.POST)
    public String processSubmit(@ModelAttribute("profile")Profile profile,
                                BindingResult result,
                                SessionStatus status,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes)
    {
       DaoResult daoResult = profileService.updateProfile(profile);
       return "redirect:profile.htm?profileId=" + profile.getProfileId();

    }




}


