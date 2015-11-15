package com.school.course.controller;

import com.school.assignment.service.AssignmentService;
import com.school.clazz.model.ClassRoutineConfiguration;
import com.school.clazz.service.ClazzService;
import com.school.course.model.CourseRoutine;
import com.school.course.model.Course;
import com.school.course.service.CourseService;
import com.school.user.model.Teacher;
import com.school.user.service.UserService;
import com.school.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.school.course.service")
public class CourseController {

    @Autowired
    CourseService courseService;
    @Autowired
    ClazzService clazzService;
    @Autowired
    UserService userService;
    @Autowired
    AssignmentService assignmentService;


    @RequestMapping(value = "/edu/private/addUpdateCourse.web",
            method = RequestMethod.GET)
    public String initCourse(ModelMap map, @RequestParam(value = "courseId",required = false)Integer courseId)
    {
        Course course = null;
        if(courseId!=null){
            course = courseService.getCourseById(courseId);
        }
        else{
            course = new Course();
        }
        map.addAttribute("classList", clazzService.getClassList());
        map.addAttribute("teacherList", userService.getDetailUserList(Teacher.class));
        map.addAttribute("course", course);

        return "course/addCourse";
    }

    @RequestMapping(value = "/private/viewCourse.web",
            method = RequestMethod.GET)
    public String viewCourse(ModelMap map, @RequestParam(value = "courseId")Integer courseId)
    {
        Course course = null;
        if(courseId!=null){
            course = courseService.getCourseById(courseId);
        }
        map.addAttribute("assignMentList",assignmentService.getAssignmentByCourseId(courseId));
        map.addAttribute("classList", clazzService.getClassList());
        map.addAttribute("teacherList", userService.getUserList(Teacher.class));
        map.addAttribute("course", course);

        return "course/viewCourse";
    }

    @RequestMapping(value = "/private/classCourses.web",
            method = RequestMethod.GET)
    public String getClassCourses(ModelMap map, @RequestParam("classId")Integer classId)
    {
        map.addAttribute("courseList",courseService.getCourseListByClassId(classId));
        return "course/courses";
    }
    @RequestMapping(value = "/edu/private/addUpdateCourse.web",
            method = RequestMethod.POST)
    public String saveCourse(@ModelAttribute("course")Course course, RedirectAttributes redirectAttributes )
    {
        try {
            courseService.saveOrUpdate(course);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:addUpdateCourse.web";
    }

    @RequestMapping(value = "/edu/private/addUpdateCourseRoutine.web",
            method = RequestMethod.GET)
    public String initClassRoutine(@RequestParam("classId") Integer classId, ModelMap map, HttpServletRequest request)
    {
        List<Course> courseList = courseService.getCourseListByClassId(classId, true);
        Map<String, List<CourseRoutine>> routineListByDay = new HashMap<>();
        Map<Integer,String> courseMap = new HashMap<>();
         for(Course course:courseList){
            for(CourseRoutine routine:course.getCourseRoutineList()){
                List<CourseRoutine> courseRoutines = routineListByDay.get(routine.getDay());
                if(courseRoutines ==null){
                    courseRoutines = new ArrayList<>();
                    routineListByDay.put(routine.getDay(), courseRoutines);
                }
                courseRoutines.add(routine);
            }
            courseMap.put(course.getCourseId(), course.getCourseName());
        }
        map.addAttribute("routineListByDay", routineListByDay);
        map.addAttribute("courseMap", courseMap);
        map.addAttribute("clazz", clazzService.getClassById(classId));
        map.addAttribute("courseRoutine", new CourseRoutine());

        return "course/manageRoutine";
    }

    @RequestMapping(value = "/edu/private/CourseRoutine.web",method = RequestMethod.POST)
    public String updateCourseRoutine(@RequestParam("classId") Integer classId, ModelMap map,@RequestParam("courseRoutineList")String[] courseRoutineArray,RedirectAttributes redirectAttributes, HttpServletRequest request)
    {
        ClassRoutineConfiguration crConf = clazzService.getClassRoutineConfigByClassId(classId);
        Map<String,String> dayIndexMap = new HashMap();
        dayIndexMap.put("1","sun");
        dayIndexMap.put("2","mon");
        dayIndexMap.put("3","tue");
        dayIndexMap.put("4","wed");
        dayIndexMap.put("5","thu");
        List<CourseRoutine> courseRoutineList = new ArrayList<>();
        for(String routineInfo : courseRoutineArray){
            if(routineInfo == null || routineInfo.trim().isEmpty())continue;
            String[] split = routineInfo.split("_");
            int pos = Integer.parseInt(split[1]);
            if(pos>=crConf.getBreakIndex())pos--;
            CourseRoutine courseRoutine = new CourseRoutine();
            courseRoutine.setDay(dayIndexMap.get(split[0]));
            courseRoutine.setPosition(pos);
            courseRoutine.setCourseId(Integer.parseInt(split[2]));
            courseRoutine.setClassId(classId);

            courseRoutineList.add(courseRoutine);
        }
        System.out.println( request.getScheme() + "://"  + request.getServerName()+":" + request.getServerPort() +  request.getContextPath()  +"/private/CourseRoutine.web?classId=" + classId);
        courseService.saveOrUpdate(courseRoutineList);

        return "redirect:"  + request.getScheme() + "://"  + request.getServerName()+":" + request.getServerPort() +  request.getContextPath()  +"/private/CourseRoutine.web?classId=" + classId;
    }
    @RequestMapping(value = "/private/CourseRoutine.web",
            method = RequestMethod.GET)
    public String getCourseRoutine(@RequestParam("classId") Integer classId, ModelMap map, HttpServletRequest request)
    {
        List<Course> courseList = courseService.getCourseListByClassId(classId, true);
        String[][] classRoutine = clazzService.populateCourseRoutine(courseList,classId);
        Map<String,Course> courseMap = new HashMap<>();
        for(Course course:courseList){
            courseMap.put(course.getCourseId()+"",course);
        }
        map.addAttribute("clazz", clazzService.getClassById(classId));
        map.addAttribute("classRoutine", classRoutine);
        map.addAttribute("courseMap", courseMap);
        return "course/ClazzRoutine";
    }
    @RequestMapping(value = "/edu/private/addUpdateCourseRoutine.web",
            method = RequestMethod.POST)
    public String saveCourseRoutine(@ModelAttribute("courseRoutine") CourseRoutine courseRoutine, RedirectAttributes redirectAttributes,@RequestParam("classId") Integer classId)
    {
        courseService.saveOrUpdate(courseRoutine);
        return "redirect: addUpdateCourseRoutine.web?classId=" + classId;
    }



}
