package com.mkyong.message.service;

import com.mkyong.assignment.model.Assignment;
import com.mkyong.message.dao.MessageDAO;
import com.mkyong.message.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class MessageService {
    @Autowired
    MessageDAO messageDAO;

    @Transactional
    public void saveOrUpdate(Message message) {
        try{
            messageDAO.saveOrUpdate(message);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public Message getMessageById(Integer messageId){
        return messageDAO.getById(Message.class, messageId);
    }

    @Transactional
    public List<Message> getMessageByGroupKey(String messageKey){
        return messageDAO.getByHql(" from " + Message.class.getSimpleName() + " where messageGroupKey =  '" + messageKey + "'") ;
    }

    @Transactional
    public List<Message> getMessageByAssignmentId(Integer assignmentId){
        try{
            Object[] assignmentFields = messageDAO.getUniqueByHql(" select messageKey from " + Assignment.class.getSimpleName() + " where assignmentId = " + assignmentId);
            if(assignmentFields.length == 1){
                return messageDAO.getByHql(" from " + Message.class.getSimpleName() + " where messageGroupKey = " + assignmentFields[0]);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }






}
