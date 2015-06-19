package com.mkyong.clazz.model;


import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by safayat on 2/1/15.
 *
 rc_date datetime NOT NULL
 rc_teacher_id int(11) unsigned NOT NULL
 rc_class_id int(11) unsigned NOT NULL
 */
@Entity
@Table(name = "classRoutineConfiguration")
public class ClassRoutineConfiguration{
    private Integer classRoutineConfigurationId;
    private Integer classId;
    private Integer startTime;
    private Integer endTime;
    private Integer classUnitTime;
    private Integer breakStartTime;
    private Integer breakLength;

    public ClassRoutineConfiguration() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getClassRoutineConfigurationId() {
        return classRoutineConfigurationId;
    }

    public void setClassRoutineConfigurationId(Integer classRoutineConfigurationId) {
        this.classRoutineConfigurationId = classRoutineConfigurationId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }

    public Integer getClassUnitTime() {
        return classUnitTime;
    }

    public void setClassUnitTime(Integer classUnitTime) {
        this.classUnitTime = classUnitTime;
    }

    public Integer getBreakStartTime() {
        return breakStartTime;
    }

    public void setBreakStartTime(Integer breakStartTime) {
        this.breakStartTime = breakStartTime;
    }

    public Integer getBreakLength() {
        return breakLength;
    }

    public void setBreakLength(Integer breakLength) {
        this.breakLength = breakLength;
    }
    
    @Transient
    public int getClazzCount(){
        return (getEndTime() - getBreakLength() - getStartTime())/getClassUnitTime();
    }

    @Transient
    public int getBreakIndex(){
        return (getBreakStartTime()-getStartTime())/getClassUnitTime()+1;

    }
    
}

