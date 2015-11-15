package com.school.user.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "staff")
public class Staff extends CommonUser{
    private Integer staffId;
    private String designation;
    private String startingDesignation;
    private String employeeLevel;
    private Date dateOfJoin;
    private  String fullName;

    public Staff() {
        super();
    }

    public Staff(Login user) {
        super();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
