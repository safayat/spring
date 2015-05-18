package com.mkyong.clazz.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 * att_date datetime NOT NULL
 att_student_id int(11) unsigned NOT NULL
 att_is_present tinyint(4) NULL
 att_class_id int(10) unsigned NOT NULL
 */
@Entity
@Table(name = "attendance"/*,uniqueConstraints = {
        @UniqueConstraint(columnNames = { "att_date","att_class_id"})}*/)
public class Attendance implements Serializable{
    private Date attDate;
    private int studentId;
    private boolean isPresent;
    private int classId;
    private int attId;
    private RollCall rollCall;

    public Attendance() {
    }

    public Attendance(Date attDate, int studentId, boolean isPresent, int classId, int attId) {
        this.attDate = attDate;
        this.studentId = studentId;
        this.isPresent = isPresent;
        this.classId = classId;
        this.attId = attId;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "attDate=" + attDate +
                ", studentId=" + studentId +
                ", isPresent=" + isPresent +
                ", classId=" + classId +
                '}';
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "att_id",unique = true,nullable = false)
    public int getAttId() {
        return attId;
    }

    public void setAttId(int attId) {
        this.attId = attId;
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    @JoinColumns({
            @JoinColumn(name = "att_date", referencedColumnName = "rc_date" , insertable = false, updatable = false),
            @JoinColumn(name = "att_class_id", referencedColumnName = "rc_class_id",insertable = false, updatable = false)

    })
    public RollCall getRollCall() {
        return rollCall;
    }

    public void setRollCall(RollCall rollCall) {
        this.rollCall = rollCall;
    }
}
