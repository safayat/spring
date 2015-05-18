package com.mkyong.exam.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "examResult")
public class ExamResult {
    private Integer resultId;
    private Integer courseId;
    private Integer studentId;
    private Integer examGroupId;
    private Integer mark;
    private Integer grade;
    private Integer totalMark;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getResultId() {
        return resultId;
    }

    public void setResultId(Integer resultId) {
        this.resultId = resultId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getExamGroupId() {
        return examGroupId;
    }

    public void setExamGroupId(Integer examGroupId) {
        this.examGroupId = examGroupId;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getTotalMark() {
        return totalMark;
    }

    public void setTotalMark(Integer totalMark) {
        this.totalMark = totalMark;
    }
}
