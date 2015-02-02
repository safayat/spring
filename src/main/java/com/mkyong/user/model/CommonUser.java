package com.mkyong.user.model;

import com.mkyong.login.model.Login;

import java.util.Date;

public abstract class CommonUser {
    Login login;

    /*public abstract int getTeacherId();

    public abstract int getUserId();

    public abstract String getDestination();

    public abstract Date getJoiningDate();*/

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }


}
