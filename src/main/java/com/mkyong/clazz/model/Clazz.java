package com.mkyong.clazz.model;

import com.mkyong.user.model.Student;
import com.mkyong.user.model.Teacher;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

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
@Table(name = "class",uniqueConstraints = {
        @UniqueConstraint(columnNames ="cs_name"),
        @UniqueConstraint(columnNames ="cs_captain_id")
})

public class Clazz {
    private int classId;
    private String className;
    private Integer classCaptainId;
    private Integer classTeacherId;
    private String classTeacherName;
    private String classCaptainName;
    private Teacher classTeacher;
    private Student classCaptain;
    private List<Student> studentList;


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
//    @Transient
    public Integer getClassTeacherId() {
        return classTeacherId;
    }

    public void setClassTeacherId(Integer classTeacherId) {
        this.classTeacherId = classTeacherId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cs_teacher_id", nullable = true, referencedColumnName = "tr_teacher_id", insertable = false, updatable = false)
    @JsonManagedReference
    public Teacher getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(Teacher classTeacher) {
        this.classTeacher = classTeacher;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "clazz")
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

    @OneToOne(fetch = FetchType.EAGER, targetEntity = Student.class)
    @JoinColumn(insertable = false, updatable = false, name = "cs_captain_id", referencedColumnName = "st_student_id")
    @JsonManagedReference
    public Student getClassCaptain() {
        return classCaptain;
    }

    public void setClassCaptain(Student classCaptain) {
        this.classCaptain = classCaptain;
    }

   /* @Override
    public String toString() {
        return "Clazz123{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                ", classCaptainId=" + classCaptainId +
                ", classTeacherId=" + classTeacherId +
                ", classTeacher=" + classTeacher +
                '}';
    }*/
}
