package com.mkyong.exam.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "examGroup")
public class ExamGroup {
    private Integer examGroupId;
    private Integer examYear;
    private Integer classId;
    private Date examStartDate;
    private Date examEndDate;
    private Date resultPublishedDate;
    private String examName;
    private Boolean resultPublished;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getExamGroupId() {
        return examGroupId;
    }

    public void setExamGroupId(Integer examGroupId) {
        this.examGroupId = examGroupId;
    }

    public Integer getExamYear() {
        return examYear;
    }

    public void setExamYear(Integer examYear) {
        this.examYear = examYear;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getExamStartDate() {
        return examStartDate;
    }

    public void setExamStartDate(Date examStartDate) {
        this.examStartDate = examStartDate;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getExamEndDate() {
        return examEndDate;
    }

    public void setExamEndDate(Date examEndDate) {
        this.examEndDate = examEndDate;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Date getResultPublishedDate() {
        return resultPublishedDate;
    }

    public void setResultPublishedDate(Date resultPublishedDate) {
        this.resultPublishedDate = resultPublishedDate;
    }

    public Boolean getResultPublished() {
        return resultPublished;
    }

    public void setResultPublished(Boolean resultPublished) {
        this.resultPublished = resultPublished;
    }
}
