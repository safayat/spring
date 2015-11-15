package com.school.user.model;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import org.hibernate.annotations.Index;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
import java.util.Date;

@MappedSuperclass
public abstract class CommonUser {

    long userId;
    long profileId;
    Login login;

    Profile profile;

    public CommonUser() {
    }

    public CommonUser(Login user) {
        login = user;
    }

    @Transient
    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }

    @Transient
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public void setProfileId(long profileId) {
        this.profileId = profileId;
    }

    public long getProfileId() {
        return profileId;
    }

    public abstract void setFullName(String fullName);
    @Transient
    public abstract String getFullName();



/*
    @Transient
    public String getFullName() {
        return profile.getFullName();
    }
*/

/*
    @Transient
    public String getPassword() {
        return login.getPassword();
    }

    @Transient
    public void setPassword(String password) {
        login.setPassword(password);
    }

    @Transient
    public String getUsername() {
        return login.getUsername();
    }

    @Transient
    public void setUsername(String username) {
        login.setUsername(username);
    }

    @Transient
    public String getEmail() {
        return login.getEmail();
    }

    @Transient
    public void setEmail(String email) {
        login.setEmail(email);
    }
    @Transient
    public String getConfirmPassword() {
        return login.getConfirmPassword();
    }

    @Transient
    public String getUserType() {
            return login.getUserType();
        }

    @Transient
    public void setUserType(String userType) {
        this.login.setUserType(userType);
    }

    @Transient
    public void setConfirmPassword(String confirmPassword) {
        login.setConfirmPassword(confirmPassword);
    }

*/

}
