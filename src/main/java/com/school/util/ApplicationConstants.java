package com.school.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 7/21/14.
 */
public class ApplicationConstants {
    public static final String LOGIN_DATA="loginData";
    public static final String EMAIL_REGEX=".+@.+\\..+";
    public static final String LOGIN_PAGE="login/login";
    public static  String APP_URL(HttpServletRequest request){
        return request.getScheme() + "://" +   // "http" + "://
                request.getServerName() +       // "myhost"
                ":" + request.getServerPort() + request.getContextPath();
    }

}
