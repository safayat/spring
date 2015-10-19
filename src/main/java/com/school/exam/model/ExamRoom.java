package com.school.exam.model;

import javax.persistence.*;

@Entity
@Table(name = "examRoom")
public class ExamRoom {
    private Integer examRoomId;
    private Integer roomNo;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getExamRoomId() {
        return examRoomId;
    }

    public void setExamRoomId(Integer examRoomId) {
        this.examRoomId = examRoomId;
    }

    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }
}
