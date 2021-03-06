package com.mkyong.login.model;

import com.mkyong.profile.model.Profile;

import javax.persistence.*;
import java.io.Serializable;
import org.codehaus.jackson.annotate.JsonManagedReference;

/**
 * Created by safayat on 4/24/14.
 */
@Entity
@Table(name = "user",uniqueConstraints = {
        @UniqueConstraint(columnNames ="username"),
        @UniqueConstraint(columnNames ="email")
})
public class Login implements Serializable{

    private Integer userId;
    private String username;
    private String password;
    private String confirmPassword;
    private String email;
    private Profile profile;
    public Login() {
		// TODO Auto-generated constructor stub
	}
    
    public Login(String username) {
        this.username = username;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId",unique = true,nullable = false)
    public Integer getUserId() {
        return userId;
    }

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "login", cascade = CascadeType.ALL)
    @JsonManagedReference
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
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

    @Column(name = "username",unique = true,nullable = false,length =20)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "email",unique = true,nullable = false,length =128)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Transient
    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    @Override
    public String toString() {
        return "Login{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", email='" + email + '\'' +
                ", profile=" + profile +
                '}';
    }
}
