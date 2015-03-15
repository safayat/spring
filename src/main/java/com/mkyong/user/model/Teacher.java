package com.mkyong.user.model;

import com.mkyong.clazz.model.Clazz;
import com.mkyong.login.model.Login;
import com.mkyong.profile.model.Profile;
import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonManagedReference;
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
@Table(name = "teacher",uniqueConstraints = {
        @UniqueConstraint(columnNames ="tr_user_id")
})

public class Teacher extends CommonUser{
    private int teacherId;
    private int userId;
    private String destination;
    private Date joiningDate;
    private Profile profile;
    private List<Clazz> clazzList;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, targetEntity = Profile.class)
    @JoinColumn(name = "tr_user_id",referencedColumnName = "profileId",insertable = false, updatable = false)
    @JsonManagedReference
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "classTeacher")
    @JsonManagedReference
    public  List<Clazz>  getClazzList() {
        return clazzList;
    }

    public void setClazzList(List<Clazz> clazzList) {
        this.clazzList = clazzList;
    }

    @Override
    public void setUsername(String username) {
        login.setUsername(username);
    }

    @Override
    public void setPassword(String password) {
        login.setPassword(password);

    }

    @Override
    public void setEmail(String email) {
        login.setEmail(email);
    }

    @Override
    public void setConfirmPassword(String confirmPassword) {
        login.setConfirmPassword(confirmPassword);
    }

    @Transient
    @Override
    public String getUsername() {
        return getLogin().getUsername();
    }

    @Transient
    @Override
    public String getConfirmPassword() {
        return getLogin().getConfirmPassword();
    }

    @Transient
    @Override
    public String getPassword() {
        return getLogin().getPassword();
    }
    @Transient
    @Override
    public String getEmail() {
        return getLogin().getEmail();
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

    @Column(name = "tr_user_id",unique = true,nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    @Transient
    @Override
    public int getId() {
        return userId;
    }

    @Override
    public void setId(int id) {
        userId = id;
    }

    @Override
    public String toString() {
        return "teacher{" +
                "teacherId=" + teacherId +
                ", userId=" + userId +
                ", destination='" + destination + '\'' +
                ", joiningDate=" + joiningDate +
                ", profile=" + profile +
                '}';
    }
}
