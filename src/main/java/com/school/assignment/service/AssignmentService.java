package com.school.assignment.service;

import com.school.assignment.dao.AssignmentDAO;
import com.school.assignment.model.Assignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class AssignmentService {
    @Autowired
    AssignmentDAO assignmentDAO;

    @Transactional
    public void saveOrUpdate(Assignment assignment) {
        try{
            assignmentDAO.saveOrUpdate(assignment);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public Assignment getAssignmentById(Integer assignmentId){
        return assignmentDAO.getById(Assignment.class, assignmentId);
    }

    @Transactional
    public List<Assignment> getAssignmentByCourseId(Integer courseId){
        return assignmentDAO.getByHql(" from " + Assignment.class.getSimpleName() + " where courseId = " + courseId) ;
    }




}
