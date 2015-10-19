package com.school.message.model;


import javax.persistence.*;
import java.util.Date;

/**
 * Created by safayat on 2/1/15.
 *
 messageId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `messageGroupKey` varchar(16) NOT NULL,
 `senderId` int(10) unsigned NOT NULL,
 `recieverId` int(10) unsigned NOT NULL,
 `messageCreationTime` datetime NOT NULL,
 `message` text NOT NULL,
 */
@Entity
@Table(name = "message")
public class Message {
    private Long messageId;
    private Date messageCreationTime;
    private Integer senderId;
    private Integer recieverId;
    private String messageGroupKey;
    private String message;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getMessageId() {
        return messageId;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public Date getMessageCreationTime() {
        return messageCreationTime;
    }

    public void setMessageCreationTime(Date messageCreationTime) {
        this.messageCreationTime = messageCreationTime;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getRecieverId() {
        return recieverId;
    }

    public void setRecieverId(Integer recieverId) {
        this.recieverId = recieverId;
    }

    public String getMessageGroupKey() {
        return messageGroupKey;
    }

    public void setMessageGroupKey(String messageGroupKey) {
        this.messageGroupKey = messageGroupKey;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
