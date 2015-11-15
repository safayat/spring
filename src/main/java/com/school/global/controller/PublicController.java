package com.school.global.controller;

import com.google.gson.Gson;
import com.school.login.model.Login;
import com.school.login.service.LoginService;
import com.school.login.validator.LoginValidator;
import com.school.login.validator.SignupValidator;
import com.school.util.ApplicationConstants;
import com.school.util.DaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;

//import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 4/24/14.
 */

@Controller
public class PublicController {

    @RequestMapping(value = "/theme.web",
            method = RequestMethod.GET)
    public String getTheme()
    {
        return "login/theme";
    }


    @RequestMapping(value = "/public/admission.web",
            method = RequestMethod.GET)
    public String admissionInfo(HttpServletRequest request,Principal principal)
    {
        return "common/admission";
    }

    @RequestMapping(value = "/public/history.web",
            method = RequestMethod.GET)
    public String history(HttpServletRequest request,Principal principal)
    {
        return "common/history";
    }

    @RequestMapping(value = "/public/downloads.web",
            method = RequestMethod.GET)
    public String downloads()
    {
        return "common/downloads";
    }


}

