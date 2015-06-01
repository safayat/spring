package com.mkyong.exam.service;

import com.mkyong.exam.dao.ExamDAO;
import com.mkyong.exam.model.AddmissionExamSeatplan;
import com.mkyong.exam.model.ExamGroup;
import com.mkyong.exam.model.ExamResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class ExamService {
    @Autowired
    ExamDAO examDAO;

    @Transactional
    public void saveOrUpdate(ExamGroup examGroup){
        try{
            examDAO.saveOrUpdate(examGroup);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public void saveOrUpdate(List<ExamResult> examResultList) throws Exception{
            for(ExamResult examResult:examResultList)
                examDAO.saveOrUpdate(examResult);
    }

    @Transactional
    public ExamGroup getExamGroupById(Integer id){
        return examDAO.getById(ExamGroup.class,id);
    }

    @Transactional
    public List<ExamGroup> getAllExamGroup(){
        return examDAO.getAll(ExamGroup.class);
    }

    @Transactional
    public List<ExamGroup> getExamGroupByClass(Integer classId){
        return examDAO.getByHql("from " + ExamGroup.class.getSimpleName() + " where classId=" + classId);
    }

  @Transactional
    public List<ExamResult> getCourseResultList(Integer courseId,Integer examGroupId){
        return examDAO.getByHql("from " + ExamResult.class.getSimpleName() + " where examGroupId=" + examGroupId + " and courseId=" + courseId);
    }

  @Transactional
    public List<ExamResult> getClassResultList(Integer examGroupId){
        return examDAO.getByHql("from " + ExamResult.class.getSimpleName() + " where examGroupId=" + examGroupId);
    }

  @Transactional
    public List<ExamResult> getStudentCourseResultList(Integer courseId,Integer examGroupId,Integer studentId){
        return examDAO.getByHql("from " + ExamResult.class.getSimpleName() + " where examGroupId=" + examGroupId + " and courseId=" + courseId + " and studentId=" + studentId);
    }

  @Transactional
    public List<ExamResult> getStudentResultList(Integer examGroupId, Integer studentId){
        return examDAO.getByHql("from " + ExamResult.class.getSimpleName() + " where examGroupId=" + examGroupId + " and studentId=" + studentId);
    }

    @Transactional
    public List<AddmissionExamSeatplan> getAllAdmissionSeatPlan(Integer examId){
        return examDAO.getByHql(" from " + AddmissionExamSeatplan.class.getSimpleName() + " where examId = " + examId);
    }


}
