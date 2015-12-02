package com.school.user.model;

import com.google.common.base.Strings;
import com.school.clazz.model.Clazz;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.util.DaoResult;
import com.school.util.StringUtility;
import org.hibernate.annotations.ForeignKey;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 tr_teacher_idint(11) unsigned NOT NULL
 tr_user_idint(11) unsigned NOT NULL
 tr_designationvarchar(32) NOT NULL
 tr_joining_datedate NOT NULL
 */
@Entity
@Table(name = "teacher")
public class Teacher extends CommonUser{
    private int teacherId;
    private String destination;
    private Date joiningDate;
    private  String fullName;

    public Teacher() {
    }

    public Teacher(Login user) {
        super(user);
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tr_teacher_id",unique = true,nullable = false)
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Column(name = "tr_designation",nullable = true)
    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    @Column(name = "tr_joining_date",nullable = true)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    @Override
    public String getFullName() {
        return fullName;
    }

    @Override
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "teacher{" +
                "teacherId=" + teacherId +
                ", userId=" + userId +
                ", destination='" + destination + '\'' +
                ", joiningDate=" + joiningDate +
                '}';
    }

    public DaoResult validate(){
        StringBuilder sb = new StringBuilder();
        boolean valid=true;
        DaoResult daoResult = new DaoResult();
        if(Strings.isNullOrEmpty(destination)){
            sb.append("Designation is empty");
            valid = false;
        }
        if(!valid){
            daoResult.setValues(false,sb.toString(),DaoResult.VALIDATION_ERROR);
        }
        return daoResult;
    }
}
