package com.school.user.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.profile.model.Profile;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "staff")
public class Staff extends CommonUser{
    private Integer staffId;
    private Integer userId;
    private String designation;
    private String startingDesignation;
    private String employeeLevel;
    private Date dateOfJoin;
    private Profile profile;

    @OneToOne(fetch = FetchType.EAGER, targetEntity = Profile.class)
    @JoinColumn(name = "userId",referencedColumnName = "profileId",insertable = false, updatable = false)
    @JsonManagedReference
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
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
    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getStartingDesignation() {
        return startingDesignation;
    }

    public void setStartingDesignation(String startingDesignation) {
        this.startingDesignation = startingDesignation;
    }

    public String getEmployeeLevel() {
        return employeeLevel;
    }

    public void setEmployeeLevel(String employeeLevel) {
        this.employeeLevel = employeeLevel;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getDateOfJoin() {
        return dateOfJoin;
    }

    public void setDateOfJoin(Date dateOfJoin) {
        this.dateOfJoin = dateOfJoin;
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

    @Transient
    @Override
    public String getUserType() {
        return getLogin().getUserType();
    }

    @Override
    public void setUserType(String userType) {
        getLogin().setUserType(userType);
    }


}
