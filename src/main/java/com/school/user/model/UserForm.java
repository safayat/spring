package com.school.user.model;

import com.school.login.model.Login;
import com.school.profile.model.Profile;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 st_student_idint(11) unsigned NOT NULL
 st_user_id int(11) unsigned NOT NULL
 st_class_id int(11) NOT NULL
 st_admission_date date NULL
 st_parent_user_id int(11) unsigned NULL
 st_roll varchar(16) NULL


 */
public class UserForm{

// Login
    private String username;
    private String password;
    private String email;
    private String userType;
    // Student
    private Integer classId;
    private Date admissionDate;
    private String rollNumber;
    // Teacher and staff
    private String designation;
    private Date dateOfJoin;
// profile
    private String firstName;
    private String lastName;

    public UserForm() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getDateOfJoin() {
        return dateOfJoin;
    }

    public void setDateOfJoin(Date dateOfJoin) {
        this.dateOfJoin = dateOfJoin;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Login createLogin(){
        Login login = new Login();
        login.setEmail(email);
        login.setUsername(username);
        login.setPassword(password);
        login.setUserCreated(new Date());
        login.setUserType(userType);
        return login;
    }

    public CommonUser createUser(){
        CommonUser commonUser = null;
        if("teacher".equalsIgnoreCase(userType)){
            Teacher t = new Teacher();
            t.setDestination(designation);
            t.setJoiningDate(dateOfJoin);
            commonUser = t;
        }else if("student".equalsIgnoreCase(userType)){
            Student s = new Student();
            s.setClassId(classId);
            s.setAdmissionDate(admissionDate);
            s.setRollNumber(rollNumber);
            commonUser = s;
        }else if("staff".equalsIgnoreCase(userType)){
            Staff sf = new Staff();
            sf.setDateOfJoin(dateOfJoin);
            sf.setDesignation(designation);
            commonUser = sf;
        }
        commonUser.setFullName(firstName + " " + lastName);
        commonUser.setLogin(createLogin());
        commonUser.setProfile(createProfile());
        return commonUser;
    }
    public Profile createProfile(){
        Profile profile = new Profile();
        profile.setFirstName(firstName);
        profile.setLastName(lastName);
        return profile;
    }
}
