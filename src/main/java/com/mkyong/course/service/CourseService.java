package com.mkyong.course.service;

import com.mkyong.clazz.dao.ClazzDAO;
import com.mkyong.clazz.model.Attendance;
import com.mkyong.clazz.model.ClassRoutineConfiguration;
import com.mkyong.clazz.model.Clazz;
import com.mkyong.clazz.model.RollCall;
import com.mkyong.course.dao.CourseDAO;
import com.mkyong.course.model.Course;
import com.mkyong.course.model.CourseRoutine;
import com.mkyong.user.model.Student;
import com.mkyong.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class CourseService {
    @Autowired
    CourseDAO courseDAO;

    @Transactional
    public void saveOrUpdate(Course course) throws Exception {
        courseDAO.saveOrUpdate(course);
    }

    @Transactional
    public void saveOrUpdate(CourseRoutine courseRoutine){
        try{
            courseDAO.saveOrUpdate(courseRoutine);
        }catch (Exception e){

        }
    }
    @Transactional
    public void saveOrUpdate(List<CourseRoutine> courseRoutineList){
        try{
            for(CourseRoutine courseRoutine:courseRoutineList){
                CourseRoutine oldCourseRoutine = courseDAO.getUniqueByHql("from " + CourseRoutine.class.getSimpleName() + " where classId=" + courseRoutine.getClassId() + " and position = " + courseRoutine.getPosition() + " and day = '" + courseRoutine.getDay() + "'");
                if(oldCourseRoutine!=null){
                    oldCourseRoutine.setCourseId(courseRoutine.getCourseId());
//                    courseDAO.saveOrUpdate(oldCourseRoutine);
                }else
                courseDAO.saveOrUpdate(courseRoutine);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public List<Course> getCourseListByClassId(Integer classId){
        return courseDAO.getByHql(" from " + Course.class.getSimpleName() + " where classId= " + classId);
    }
    @Transactional
    public Course getCourseById(Integer courseId){
        return courseDAO.getById(Course.class,courseId);
    }

    @Transactional
    public List<Course> getAllCourse(){
        return courseDAO.getAll(Course.class);
    }

    @Transactional
    public List<Course> getCourseListByClassId(Integer classId, boolean eager){
        List<Course> courseList = courseDAO.getByHql(" from " + Course.class.getSimpleName() + " where classId= " + classId);
        if(eager){
            for(Course course:courseList){
                course.getCourseRoutineList().size();
            }
        }
        return courseList;
    }





}
