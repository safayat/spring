package com.school.leave.service;

import com.school.exam.model.ExamResult;
import com.school.leave.dao.LeaveDAO;
import com.school.leave.model.LeaveApplication;
import com.school.login.model.Login;
import com.school.menu.dao.MenuDAO;
import com.school.menu.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class LeaveService {
    @Autowired
    private LeaveDAO leaveDAO;

    @Transactional
    public LeaveApplication getById(Integer id){
        return leaveDAO.getById(LeaveApplication.class,id);
    }

    @Transactional
    public void saveOrUpdate(LeaveApplication leaveApplication){
        try{
           leaveDAO.saveOrUpdate(leaveApplication);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public List<LeaveApplication> getAll(){
        return leaveDAO.getAll(LeaveApplication.class);
    }

    @Transactional
    public List<LeaveApplication> getAll(String applicantType){
        System.out.println("applicantType:"+applicantType);
        if(applicantType.isEmpty() || applicantType.equals("all"))return getAll();
        return leaveDAO.getByHql(" from " + LeaveApplication.class.getSimpleName() + " lv ," + Login.class.getSimpleName()
                + " us where lv.applicantUserId = us.userId and us.userType = '" + applicantType + "'");
    }
}
