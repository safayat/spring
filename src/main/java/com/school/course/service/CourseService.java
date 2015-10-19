package com.school.course.service;

import com.school.clazz.dao.ClazzDAO;
import com.school.clazz.model.Attendance;
import com.school.clazz.model.ClassRoutineConfiguration;
import com.school.clazz.model.Clazz;
import com.school.clazz.model.RollCall;
import com.school.course.dao.CourseDAO;
import com.school.course.model.Course;
import com.school.course.model.CourseRoutine;
import com.school.user.model.Student;
import com.school.util.Utility;
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
