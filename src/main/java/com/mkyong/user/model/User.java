package com.mkyong.user.model;

import com.mkyong.login.model.Login;

import javax.persistence.*;

/**
 * Created by safayat on 6/4/14.
 */
@Entity
@Table(name = "userInfo",uniqueConstraints = {
        @UniqueConstraint(columnNames ="loginId")
})
public class User {
    private String firstName;
    private String lastName;
    private String mobileNo;
    private Integer loginId;
    private Integer userInfoId;
//    private Login login;

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", mobileNo='" + mobileNo + '\'' +
                ", loginId=" + loginId +
                ", userInfoId=" + userInfoId +
//                ", login=" + login +
                '}';
    }
/*
    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }*/

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userInfoId",unique = true,nullable = false)
    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    @Column(name = "loginId",nullable = false)
    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }
    @Column(name = "firstName",unique = true,nullable = false,length =64)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    @Column(name = "lastName",unique = true,nullable = false,length =64)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    @Column(name = "mobileNo",unique = true,nullable = false,length =20)
    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

}
