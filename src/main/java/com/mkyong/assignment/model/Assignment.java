package com.mkyong.assignment.model;


import com.mkyong.course.model.Course;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 *
 `assignmentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `courseId` int(10) unsigned NOT NULL,
 `postDateTime` datetime NOT NULL,
 `startDateTime` datetime DEFAULT NULL,
 `endDateTime` datetime DEFAULT NULL,
 `teacherId` int(10) unsigned DEFAULT NULL,
 `title` varchar(512) NOT NULL,
 `description` text,
 `fileUrl` varchar(512) DEFAULT NULL,
 `messageKey` varchar(16) NOT NULL,
 `mark` int(11) DEFAULT NULL,
 */
@Entity
@Table(name = "assignment", uniqueConstraints = @UniqueConstraint(columnNames ="messageKey"))
public class Assignment {
    private int assignmentId;
    private Integer courseId;
    private Date postDateTime;
    private Date startDateTime;
    private Date endDateTime;
    private Integer userId;
    private Integer mark;
    private String title;
    private String description;
    private String fileUrl;
    private String messageKey;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getPostDateTime() {
        return postDateTime;
    }

    public void setPostDateTime(Date postDateTime) {
        this.postDateTime = postDateTime;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(Date startDateTime) {
        this.startDateTime = startDateTime;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getEndDateTime() {
        return endDateTime;
    }

    public void setEndDateTime(Date endDateTime) {
        this.endDateTime = endDateTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getMessageKey() {
        return messageKey;
    }

    public void setMessageKey(String messageKey) {
        this.messageKey = messageKey;
    }
}
