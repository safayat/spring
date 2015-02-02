package com.mkyong.clazz.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 * att_date datetime NOT NULL
 att_student_id int(11) unsigned NOT NULL
 att_is_present tinyint(4) NULL
 att_class_id int(10) unsigned NOT NULL
 */
@Entity
@Table(name = "attendance")
public class Attendance {
    private Date attDate;
    private int studentId;
    private boolean isPresent;
    private int classId;

    @Override
    public String toString() {
        return "Attendance{" +
                "attDate=" + attDate +
                ", studentId=" + studentId +
                ", isPresent=" + isPresent +
                ", classId=" + classId +
                '}';
    }

    @Column(name = "att_date",nullable = false)
    public Date getAttDate() {
        return attDate;
    }

    public void setAttDate(Date attDate) {
        this.attDate = attDate;
    }

    @Column(name = "att_student_id",nullable = false)
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @Column(name = "att_is_present",nullable = false)
    public boolean isPresent() {
        return isPresent;
    }

    public void setPresent(boolean isPresent) {
        this.isPresent = isPresent;
    }

    @Column(name = "att_class_id",nullable = false)
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }
}