package com.mkyong.clazz.model;

import com.mkyong.user.model.Student;
import org.codehaus.jackson.annotate.JsonManagedReference;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by safayat on 2/1/15.
 *
 rc_date datetime NOT NULL
 rc_teacher_id int(11) unsigned NOT NULL
 rc_class_id int(11) unsigned NOT NULL
 */
@Entity
@Table(name = "rollCall")
public class RollCall implements Serializable{
    private Date rollCallDate;
    private int techaerId;
    private int classId;
    private int rcId;
    private List<Attendance> attendanceList;

    public RollCall(Date rollCallDate, int rcId) {
        this.rollCallDate = rollCallDate;
        this.rcId = rcId;
    }

    public RollCall() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rc_id",unique = true,nullable = false)
    public int getRcId() {
        return rcId;
    }

    public void setRcId(int rcId) {
        this.rcId = rcId;
    }

    @Column(name = "rc_date",nullable = false)
    public Date getRollCallDate() {
        return rollCallDate;
    }

    public void setRollCallDate(Date rollCallDate) {
        this.rollCallDate = rollCallDate;
    }

    @Column(name = "rc_teacher_id",nullable = false)
    public int getTechaerId() {
        return techaerId;
    }

    public void setTechaerId(int techaerId) {
        this.techaerId = techaerId;
    }

    @Column(name = "rc_class_id",nullable = false)
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "rollCall")
    @JsonManagedReference
    public List<Attendance> getAttendanceList() {
        return attendanceList;
    }

    public void setAttendanceList(List<Attendance> attendanceList) {
        this.attendanceList = attendanceList;
    }

    @Override
    public String toString() {
        return "RollCall{" +
                "rollCallDate=" + rollCallDate +
                ", techaerId=" + techaerId +
                ", classId=" + classId +
                '}';
    }
}
