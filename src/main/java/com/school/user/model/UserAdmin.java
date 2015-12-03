package com.school.user.model;

import com.google.common.base.Strings;
import com.school.login.model.Login;
import com.school.util.DaoResult;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 tr_teacher_idint(11) unsigned NOT NULL
 tr_user_idint(11) unsigned NOT NULL
 tr_designationvarchar(32) NOT NULL
 tr_joining_datedate NOT NULL
 */
public class UserAdmin extends CommonUser{

    public UserAdmin() {
    }

    public UserAdmin(Login user) {
        super(user);
    }

    @Override
    public void setFullName(String fullName) {
    }

    @Override
    public String getFullName() {
        return profile.getFullName();
    }
}
