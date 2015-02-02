package com.mkyong.clazz.model;

import javax.persistence.*;

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
    private int className;
    private int classCaptainId;
    private int classTeacherId;

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
    public int getClassName() {
        return className;
    }

    public void setClassName(int className) {
        this.className = className;
    }

    @Column(name = "cs_captain_id",unique = true,nullable = true)
    public int getClassCaptainId() {
        return classCaptainId;
    }

    public void setClassCaptainId(int classCaptainId) {
        this.classCaptainId = classCaptainId;
    }

    @Column(name = "cs_teacher_id",unique = true,nullable = true)
    public int getClassTeacherId() {
        return classTeacherId;
    }

    public void setClassTeacherId(int classTeacherId) {
        this.classTeacherId = classTeacherId;
    }

    @Override
    public String toString() {
        return "clazz{" +
                "classId=" + classId +
                ", className=" + className +
                ", classCaptainId=" + classCaptainId +
                ", classTeacherId=" + classTeacherId +
                '}';
    }
}
