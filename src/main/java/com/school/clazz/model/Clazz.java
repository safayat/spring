package com.school.clazz.model;

import com.school.user.model.Student;
import com.school.user.model.Teacher;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.annotations.ForeignKey;

import javax.persistence.*;
import java.util.List;

/**
 * Created by safayat on 2/1/15.
 *
 FieldTypeComment
 cs_class_id int(11) unsigned NOT NULL
 cs_name varchar(32) NOT NULL
 cs_captain_id int(11) unsigned NULL
 cs_teacher_id int(11) unsigned NULL
 */
@Entity
@Table(name = "class")

public class Clazz {
    private int classId;
    private String className;
    private String sectionName;
    private String shiftName;
    private Integer classCaptainId;
    private Integer classTeacherId;
    private String classTeacherName;
    private String classCaptainName;
    private Teacher classTeacher;
    private Student classCaptain;
    private List<Student> studentList;
    private int studentCount;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cs_class_id",unique = true,nullable = false)
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @Column(name = "cs_name",unique = true,nullable = false)
    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Column(name = "cs_captain_id",nullable = true)
    public Integer getClassCaptainId() {
        return classCaptainId;
    }

    public void setClassCaptainId(Integer classCaptainId) {
        this.classCaptainId = classCaptainId;
    }

    @Column(name = "cs_teacher_id",nullable = true)
    public Integer getClassTeacherId() {
        return classTeacherId;
    }

    public void setClassTeacherId(Integer classTeacherId) {
        this.classTeacherId = classTeacherId;
    }

    @Transient
    @JsonManagedReference
    public Teacher getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(Teacher classTeacher) {
        this.classTeacher = classTeacher;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "clazz")
    @ForeignKey(name="none")
    @JsonManagedReference
    public List<Student> getStudentList() {
        return studentList;
    }

    public void setStudentList(List<Student> studentList) {
        this.studentList = studentList;
    }

    @Transient
    public String getClassTeacherName() {
        return classTeacherName;
    }

    public void setClassTeacherName(String classTeacherName) {
        this.classTeacherName = classTeacherName;
    }
    @Transient
    public String getClassCaptainName() {
        return classCaptainName;
    }

    public void setClassCaptainName(String classCaptainName) {
        this.classCaptainName = classCaptainName;
    }

    @Transient
    @JsonManagedReference
    public Student getClassCaptain() {
        return classCaptain;
    }

    public void setClassCaptain(Student classCaptain) {
        this.classCaptain = classCaptain;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    public String getShiftName() {
        return shiftName;
    }

    public void setShiftName(String shiftName) {
        this.shiftName = shiftName;
    }

    @Transient
    public int getStudentCount() {
        return studentCount;
    }

    public void setStudentCount(int studentCount) {
        this.studentCount = studentCount;
    }
}
