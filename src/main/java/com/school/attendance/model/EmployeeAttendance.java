package com.school.attendance.model;

import com.school.login.model.Login;
import com.school.user.model.Student;
import org.hibernate.annotations.ForeignKey;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "employeeAttendance")
public class EmployeeAttendance implements Serializable{
    private Date rollCallDate;
    private Long userId;
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

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
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
    @ForeignKey(name="none")
    @JoinColumn(insertable = false, updatable = false, name = "userId", referencedColumnName = "userId")
    public Login getUser() {
        return user;
    }

    public void setUser(Login user) {
        this.user = user;
    }
}
