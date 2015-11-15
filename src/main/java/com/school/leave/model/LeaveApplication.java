package com.school.leave.model;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.login.model.Login;
import org.hibernate.annotations.ForeignKey;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "leaveApplication")
public class LeaveApplication {
    private Integer leaveId;
    private Date fromDate;
    private Date toDate;
    private Integer applicantUserId;
    private Integer replacementUserId;
    private String leaveType;
    private String leaveStatus;
    private String leaveDescription;
    private String leaveAddress;
    private Login applicantUser;
    private Login replacementUser;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(Integer leaveId) {
        this.leaveId = leaveId;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public Integer getApplicantUserId() {
        return applicantUserId;
    }

    public void setApplicantUserId(Integer applicantUserId) {
        this.applicantUserId = applicantUserId;
    }

    public Integer getReplacementUserId() {
        return replacementUserId;
    }

    public void setReplacementUserId(Integer replacementUserId) {
        this.replacementUserId = replacementUserId;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    @Column(name = "leaveStatus")
    public String getLeaveStatus() {
        return leaveStatus;
    }

    public void setLeaveStatus(String leaveStatus) {
        this.leaveStatus = leaveStatus;
    }

    public String getLeaveDescription() {
        return leaveDescription;
    }

    public void setLeaveDescription(String leaveDescription) {
        this.leaveDescription = leaveDescription;
    }

    public String getLeaveAddress() {
        return leaveAddress;
    }

    public void setLeaveAddress(String leaveAddress) {
        this.leaveAddress = leaveAddress;
    }

//    @Transient
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "applicantUserId", nullable = true, referencedColumnName = "userId", insertable = false, updatable = false)
    @ForeignKey(name="none")
    @JsonManagedReference
    public Login getApplicantUser() {
        return applicantUser;
    }

    public void setApplicantUser(Login applicantUser) {
        this.applicantUser = applicantUser;
    }

    @Transient
    public Login getReplacementUser() {
        return replacementUser;
    }

    public void setReplacementUser(Login replacementUser) {
        this.replacementUser = replacementUser;
    }
}
