package com.school.login.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.base.Strings;
import com.school.menu.model.Menu;
import com.school.profile.model.Profile;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.util.DaoResult;
import com.school.util.JsonStringToObjectConvereter;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by safayat on 4/24/14.
 */
@Entity
@Table(name = "user",uniqueConstraints = {
        @UniqueConstraint(columnNames ="username"),
        @UniqueConstraint(columnNames ="email")
})
public class Login implements Serializable{

    private long userId;
    private String username;
    private String password;
    private String confirmPassword;
    private String email;
    private String userType;
    private String fullName;
    private Date userCreated;
    private Date lastLogin;
    private Map<Integer,Integer> permissionMap;


    public Login() {
		// TODO Auto-generated constructor stub
	}
    
    public Login(String username) {
        this.username = username;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId",unique = true,nullable = false)
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
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

    @Column(name = "email",unique = false,nullable = true,length =128)
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

    @JsonIgnore
    @Transient
    public static long getLoginIdFromPrincipal(String loginString) {
        return ((Login) JsonStringToObjectConvereter.getInstance().getObject(loginString,Login.class)).getUserId();
    }

    @Transient
    public static Login getLoginFromPrincipal(String loginString) {
        return ((Login) JsonStringToObjectConvereter.getInstance().getObject(loginString,Login.class));
    }

    @Column(name = "userType",unique = false,nullable = false,length =16)
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    @Transient
    public Map<Integer, Integer> getPermissionMap() {
        return permissionMap;
    }

    public void setPermissionMap(Map<Integer, Integer> permissionMap) {
        this.permissionMap = permissionMap;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    public Date getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(Date userCreated) {
        this.userCreated = userCreated;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Transient
    public String getFirstName() {
        try{
            return fullName.split(" ")[0];
        }catch (Exception e){

        }
        return "";
    }
    @Transient
    public String getLastName() {
        try{
            return fullName.split(" ")[1];
        }catch (Exception e){

        }
        return "";
    }
    @Transient
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "Login{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public DaoResult validate(){
        DaoResult daoResult = new DaoResult();
        if(Strings.isNullOrEmpty(username)){
            return daoResult.setValues(false," Username is empty", DaoResult.VALIDATION_ERROR);
        }
        if(Strings.isNullOrEmpty(fullName)){
            return daoResult.setValues(false," First Name or Last Name is empty", DaoResult.VALIDATION_ERROR);
        }
        if(Strings.isNullOrEmpty(password)){
            return daoResult.setValues(false," Password is empty", DaoResult.VALIDATION_ERROR);
        }
        if(Strings.isNullOrEmpty(userType)){
            return daoResult.setValues(false," User type is empty", DaoResult.VALIDATION_ERROR);
        }
        return daoResult;
    }

}
