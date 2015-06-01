package com.mkyong.attendance.model;

import com.mkyong.login.model.Login;
import com.mkyong.user.model.Student;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "employeeAttendance")
public class EmployeeAttendance implements Serializable{
    private Date rollCallDate;
    private Integer userId;
    private boolean isPresent;
    private Long employeeAttendanceId;
    private Login user;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getEmployeeAttendanceId() {
        return employeeAttendanceId;
    }

    public void setEmployeeAttendanceId(Long employeeAttendanceId) {
        this.employeeAttendanceId = employeeAttendanceId;
    }

    public Date getRollCallDate() {
        return rollCallDate;
    }

    public void setRollCallDate(Date rollCallDate) {
        this.rollCallDate = rollCallDate;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Column(name = "isPresent")
    public boolean isPresent() {
        return isPresent;
    }

    public void setPresent(boolean isPresent) {
        this.isPresent = isPresent;
    }

    @OneToOne(fetch = FetchType.EAGER, targetEntity = Login.class)
    @JoinColumn(insertable = false, updatable = false, name = "userId", referencedColumnName = "userId")
    public Login getUser() {
        return user;
    }

    public void setUser(Login user) {
        this.user = user;
    }
}
