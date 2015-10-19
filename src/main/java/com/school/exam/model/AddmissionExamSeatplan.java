package com.school.exam.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.admission.model.AdmissionApplication;
import com.school.user.model.Student;

import javax.persistence.*;

@Entity
@Table(name = "addmissionExamSeatplan")
public class AddmissionExamSeatplan {
    private Long applicantId;
    private Integer examId;
    private Integer examRoomId;
    private ExamRoom examRoom;
    private AdmissionApplication admissionApplication;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(Long applicantId) {
        this.applicantId = applicantId;
    }

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Integer getExamRoomId() {
        return examRoomId;
    }

    public void setExamRoomId(Integer examRoomId) {
        this.examRoomId = examRoomId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "examRoomId", nullable = true, referencedColumnName = "examRoomId", insertable = false, updatable = false)
    @JsonManagedReference
    public ExamRoom getExamRoom() {
        return examRoom;
    }

    public void setExamRoom(ExamRoom examRoom) {
        this.examRoom = examRoom;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(insertable = false, updatable = false, name = "applicantId", referencedColumnName = "admissionApplicationId")
    @JsonManagedReference
    public AdmissionApplication getAdmissionApplication() {
        return admissionApplication;
    }

    public void setAdmissionApplication(AdmissionApplication admissionApplication) {
        this.admissionApplication = admissionApplication;
    }
}
