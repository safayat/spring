package com.school.course.model;


import com.school.user.model.Teacher;
import org.hibernate.annotations.ForeignKey;

import javax.persistence.*;
import java.util.List;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 `courseId` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `classId` int(10) unsigned NOT NULL,
 `courseName` varchar(512) NOT NULL,
 `teacherId` int(10) unsigned DEFAULT NULL,
 `courseCode` varchar(16) NOT NULL,
 */
@Entity
@Table(name = "cs_course",uniqueConstraints = {
        @UniqueConstraint(columnNames ="courseCode")
})

public class Course {
    private int courseId;
    private Integer classId;
    private String courseName;
    private Integer teacherId;
    private String courseCode;
    private String syllabus;
    private Teacher teacher;
    private List<CourseRoutine> courseRoutineList;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getClassId() {
        return classId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    @ForeignKey(name="none")
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
    public List<CourseRoutine> getCourseRoutineList() {
        return courseRoutineList;
    }

    public void setCourseRoutineList(List<CourseRoutine> courseRoutineList) {
        this.courseRoutineList = courseRoutineList;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @ForeignKey(name="none")
    @JoinColumn(name = "teacherId", nullable = true, referencedColumnName = "tr_teacher_id", insertable = false, updatable = false)
    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getSyllabus() {
        return syllabus;
    }

    public void setSyllabus(String syllabus) {
        this.syllabus = syllabus;
    }
}
