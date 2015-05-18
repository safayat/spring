package com.mkyong.user.model;

import com.mkyong.login.model.Login;

import java.util.Date;

public abstract class CommonUser {

    Login login;

    public CommonUser() {
        login = new Login();
    }

    public abstract String getUsername();
    public abstract String getPassword();
    public abstract String getEmail();
    public abstract String getConfirmPassword();
    public abstract String getUserType();

    public abstract void setUsername(String username);
    public abstract void setPassword(String password);
    public abstract void setEmail(String email);
    public abstract void setConfirmPassword(String confirmPassword);
    public abstract void setUserType(String userType);

    public abstract int getId();
    public abstract void setId(int id);
    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }



}
