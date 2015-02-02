package com.mkyong.user.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 tr_teacher_idint(11) unsigned NOT NULL
 tr_user_idint(11) unsigned NOT NULL
 tr_designationvarchar(32) NOT NULL
 tr_joining_datedate NOT NULL
 */
@Entity
@Table(name = "teacher",uniqueConstraints = {
        @UniqueConstraint(columnNames ="tr_user_id")
})

public class Teacher extends CommonUser{
    private int teacherId;
    private int userId;
    private String destination;
    private Date joiningDate;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tr_teacher_id",unique = true,nullable = false)
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Column(name = "tr_user_id",unique = true,nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    @Column(name = "tr_designation",nullable = true)
    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    @Column(name = "tr_joining_date",nullable = true)
    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    @Override
    public String toString() {
        return "teacher{" +
                "teacherId=" + teacherId +
                ", userId=" + userId +
                ", destination='" + destination + '\'' +
                ", joiningDate=" + joiningDate +
                '}';
    }
}
