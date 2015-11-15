package com.school.util;

import com.google.common.base.Strings;
import com.school.user.model.Staff;
import com.school.user.model.Student;
import com.school.user.model.Teacher;

import java.security.SecureRandom;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

/**
 * Created by safayat on 1/7/15.
 */
public class StringUtility {

    public static String toQoute(String s){
        return "'" + s + "'";
    }

    public static boolean notEmpty(String s){
        return s != null && !s.isEmpty();
    }

}
