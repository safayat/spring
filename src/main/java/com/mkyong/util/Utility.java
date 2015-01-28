package com.mkyong.util;

import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by safayat on 1/7/15.
 */
public class Utility {
    public static boolean validateSession(HttpServletRequest request){
        return request.getSession().getAttribute(ApplicationConstants.LOGIN_DATA)!=null;
    }
}
