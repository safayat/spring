package com.mkyong.leave.service;

import com.mkyong.exam.model.ExamResult;
import com.mkyong.leave.dao.LeaveDAO;
import com.mkyong.leave.model.LeaveApplication;
import com.mkyong.login.model.Login;
import com.mkyong.menu.dao.MenuDAO;
import com.mkyong.menu.model.Menu;
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
