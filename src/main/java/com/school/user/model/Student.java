package com.school.user.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.clazz.model.Clazz;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.school.profile.model.Profile;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 st_student_idint(11) unsigned NOT NULL
 st_user_id int(11) unsigned NOT NULL
 st_class_id int(11) NOT NULL
 st_admission_date date NULL
 st_parent_user_id int(11) unsigned NULL
 st_roll varchar(16) NULL


 */
@Entity
@Table(name = "student",uniqueConstraints = {
        @UniqueConstraint(columnNames ="st_user_id"),
        @UniqueConstraint(columnNames ="st_parent_user_id")
})

public class Student extends CommonUser{
    private int studentId;
    private int userId;
    private int classId;
    private Date admissionDate;
    private Integer parentUserId;
    private String rollNumber;
    private Clazz clazz;
    private Profile profile;

    @Transient
    @Override
    public String getUsername() {
        return getLogin().getUsername();
    }

    @Transient
    @Override
    public String getConfirmPassword() {
        return getLogin().getConfirmPassword();
    }

    @Transient
    @Override
    public String getUserType() {
        return getLogin().getUserType();
    }

    @Override
    public void setUserType(String userType) {
        getLogin().setUserType(userType);
    }

    @Override
    public void setUsername(String username) {
        getLogin().setUsername(username);
    }

    @Override
    public void setPassword(String password) {
        getLogin().setPassword(password);
    }

    @Override
    public void setEmail(String email) {
        getLogin().setEmail(email);
    }

    @Override
    public void setConfirmPassword(String confirmPassword) {
        getLogin().setConfirmPassword(confirmPassword);
    }

    @Transient
    @Override
    public String getPassword() {
        return getLogin().getPassword();
    }
    @Transient
    @Override
    public String getEmail() {
        return getLogin().getEmail();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "st_student_id",unique = true,nullable = false)
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @Column(name = "st_user_id",unique = true,nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Column(name = "st_class_id",nullable = false)
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @Column(name = "st_admission_date",nullable = false)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    @Column(name = "st_parent_user_id",nullable = true)
    public Integer getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Integer parentUserId) {
        this.parentUserId = parentUserId;
    }

    @Column(name = "st_roll",nullable = false)
    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    @Transient
    @Override
    public int getId() {
        return userId;
    }

    @Override
    public void setId(int id) {
        userId = id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(insertable = false, updatable = false, name = "st_class_id", referencedColumnName = "cs_class_id", nullable = true)
    @JsonBackReference
    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    @OneToOne(fetch = FetchType.EAGER, targetEntity = Profile.class)
    @JoinColumn(name = "st_user_id",referencedColumnName = "profileId",insertable = false, updatable = false)
    @JsonManagedReference
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    @Override
    public String toString() {
        return "student{" +
                "studentId=" + studentId +
                ", userId=" + userId +
                ", classId=" + classId +
                ", admissionDate=" + admissionDate +
                ", parentUserId=" + parentUserId +
                ", rollNumber=" + rollNumber +
                '}';
    }
}
