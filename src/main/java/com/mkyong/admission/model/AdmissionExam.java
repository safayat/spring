package com.mkyong.admission.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "admissionExam")
public class AdmissionExam {
    private Integer admissionExamId;
    private Integer examyear;
    private Date startDate;
    private Date endDate;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getAdmissionExamId() {
        return admissionExamId;
    }

    public void setAdmissionExamId(Integer admissionExamId) {
        this.admissionExamId = admissionExamId;
    }

    public Integer getExamyear() {
        return examyear;
    }

    public void setExamyear(Integer examyear) {
        this.examyear = examyear;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
