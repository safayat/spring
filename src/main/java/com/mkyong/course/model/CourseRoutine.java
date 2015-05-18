package com.mkyong.course.model;


import javax.persistence.*;
import javax.persistence.criteria.Fetch;
import java.sql.Time;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 `courseRoutineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `courseId` int(10) unsigned NOT NULL,
 `day` varchar(16) NOT NULL,
 `time` time DEFAULT NULL,
 */
@Entity
@Table(name = "cr_course_routine",uniqueConstraints = {
        @UniqueConstraint(columnNames ={"courseId", "day"})
})

public class CourseRoutine {
    private int courseRoutineId;
    private Integer courseId;
    private String day;
    private String startTime;
    private String endTime;
    private Integer position;
    private Integer classId;
    private Course course;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getCourseRoutineId() {
        return courseRoutineId;
    }

    public void setCourseRoutineId(int courseRoutineId) {
        this.courseRoutineId = courseRoutineId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "courseId", nullable = true, referencedColumnName = "courseId", insertable = false, updatable = false)
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}
