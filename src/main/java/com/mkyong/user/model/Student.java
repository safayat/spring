package com.mkyong.user.model;

import javax.persistence.*;

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
    private int admissionDate;
    private int parentUserId;
    private int rollNumber;


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
    public int getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(int admissionDate) {
        this.admissionDate = admissionDate;
    }

    @Column(name = "st_parent_user_id",nullable = true)
    public int getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(int parentUserId) {
        this.parentUserId = parentUserId;
    }

    @Column(name = "st_roll",nullable = false)
    public int getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(int rollNumber) {
        this.rollNumber = rollNumber;
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
