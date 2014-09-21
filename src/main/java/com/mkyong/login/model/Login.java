package com.mkyong.login.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by safayat on 4/24/14.
 */
@Entity
@Table(name = "login",uniqueConstraints = {
        @UniqueConstraint(columnNames ="userName")
})
public class Login implements Serializable{

    private Integer userId;
    private String userName;
    private String password;
    private String email;
    public Login() {
		// TODO Auto-generated constructor stub
	}
    
    public Login(String userName) {
        this.userName = userName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId",unique = true,nullable = false)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Column(name = "password",nullable = false,length = 64)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "userName",unique = true,nullable = false,length =20)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "email",unique = true,nullable = false,length =128)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Login{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
