package com.school.user.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.clazz.model.Clazz;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.school.login.model.Login;
import com.school.profile.model.Profile;
import org.hibernate.annotations.ForeignKey;
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
@Table(name = "student")
public class Student extends CommonUser{
    private int studentId;
    private int classId;
    private Date admissionDate;
    private Integer parentUserId;
    private String rollNumber;
    private  String fullName;
    @JsonBackReference
    private Clazz clazz;

    public Student() {
    }

    public Student(Login user) {
        super(user);
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


    @ManyToOne(fetch = FetchType.LAZY)
    @ForeignKey( name = "none" )
    @JoinColumn(insertable = false, updatable = false, name = "st_class_id", referencedColumnName = "cs_class_id", nullable = true)
    public Clazz getClazz() {
        return clazz;
    }


    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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
