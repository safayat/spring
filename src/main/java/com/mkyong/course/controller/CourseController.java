package com.mkyong.course.controller;

import com.mkyong.assignment.service.AssignmentService;
import com.mkyong.clazz.model.ClassRoutineConfiguration;
import com.mkyong.clazz.service.ClazzService;
import com.mkyong.course.model.CourseRoutine;
import com.mkyong.course.model.Course;
import com.mkyong.course.service.CourseService;
import com.mkyong.user.model.Teacher;
import com.mkyong.user.service.UserService;
import com.mkyong.util.Utility;
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
@ComponentScan("com.mkyong.course.service")
public class CourseController {

    @Autowired
    CourseService courseService;
    @Autowired
    ClazzService clazzService;
    @Autowired
    UserService userService;
    @Autowired
    AssignmentService assignmentService;


    @RequestMapping(value = "/private/addUpdateCourse.web",
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
        map.addAttribute("teacherList", userService.getUserList(Teacher.class));
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
    @RequestMapping(value = "/private/addUpdateCourse.web",
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

    @RequestMapping(value = "/private/addUpdateCourseRoutine.web",
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

    @RequestMapping(value = "/private/CourseRoutine.web",method = RequestMethod.POST)
    public String updateCourseRoutine(@RequestParam("classId") Integer classId, ModelMap map,@RequestParam("courseRoutineList")String[] courseRoutineArray,RedirectAttributes redirectAttributes)
    {
        ClassRoutineConfiguration crConf = clazzService.getClassRoutineConfigByClassId(classId);
        int breakIndex = (crConf.getBreakStartTime()-crConf.getStartTime())/crConf.getClassUnitTime()+1;
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
            if(pos>=breakIndex)pos--;
            CourseRoutine courseRoutine = new CourseRoutine();
            courseRoutine.setDay(dayIndexMap.get(split[0]));
            courseRoutine.setPosition(pos);
            courseRoutine.setCourseId(Integer.parseInt(split[2]));
            courseRoutine.setClassId(classId);

            courseRoutineList.add(courseRoutine);
        }
        System.out.println("courseRoutineList size:" + courseRoutineList.size());
        courseService.saveOrUpdate(courseRoutineList);
        return "redirect:CourseRoutine.web?classId=" + classId;
    }
    @RequestMapping(value = "/private/CourseRoutine.web",
            method = RequestMethod.GET)
    public String getCourseRoutine(@RequestParam("classId") Integer classId, ModelMap map, HttpServletRequest request)
    {
        List<Course> courseList = courseService.getCourseListByClassId(classId, true);
        Map<String, List<CourseRoutine>> routineListByDay = new HashMap<>();
        Map<String,Course> courseMap = new HashMap<>();
         for(Course course:courseList){
            for(CourseRoutine routine:course.getCourseRoutineList()){
                List<CourseRoutine> courseRoutines = routineListByDay.get(routine.getDay());
                if(courseRoutines ==null){
                    courseRoutines = new ArrayList<>();
                    routineListByDay.put(routine.getDay(), courseRoutines);
                }
                courseRoutines.add(routine);
            }
            courseMap.put(course.getCourseId()+"",course);
        }
        Map<String,Integer> dayIndexMap = new HashMap();
        dayIndexMap.put("sun",1);
        dayIndexMap.put("mon",2);
        dayIndexMap.put("tue",3);
        dayIndexMap.put("wed",4);
        dayIndexMap.put("thu",5);
        String[][] classRoutine = new String[6][];
        ClassRoutineConfiguration crConf = clazzService.getClassRoutineConfigByClassId(classId);
        int clazzCount = (crConf.getEndTime() - crConf.getBreakLength() - crConf.getStartTime())/crConf.getClassUnitTime();
        int breakIndex = (crConf.getBreakStartTime()-crConf.getStartTime())/crConf.getClassUnitTime()+1;
        System.out.println("clazzCount:" + clazzCount);
        classRoutine[0]=new String[clazzCount+2];
        classRoutine[1]=new String[clazzCount+2];
        classRoutine[2]=new String[clazzCount+2];
        classRoutine[3]=new String[clazzCount+2];
        classRoutine[4]=new String[clazzCount+2];
        classRoutine[5]=new String[clazzCount+2];
        classRoutine[0][0]="";
        classRoutine[1][0]="sun";
        classRoutine[2][0]="mon";
        classRoutine[3][0]="tue";
        classRoutine[4][0]="wed";
        classRoutine[5][0]="thu";
        classRoutine[1][breakIndex]="-1";
        classRoutine[2][breakIndex]="-1";
        classRoutine[3][breakIndex]="-1";
        classRoutine[4][breakIndex]="-1";
        classRoutine[5][breakIndex]="-1";



        int j=1;
        for(int i=crConf.getStartTime();i<crConf.getBreakStartTime();i+=crConf.getClassUnitTime()){
            classRoutine[0][j++]= Utility.convertMinutesToHourAndMinutes(i) + "<------>" + Utility.convertMinutesToHourAndMinutes(i+crConf.getClassUnitTime());
        }
        classRoutine[0][j++]= Utility.convertMinutesToHourAndMinutes(crConf.getBreakStartTime()) + "<------>" + Utility.convertMinutesToHourAndMinutes(crConf.getBreakStartTime()+crConf.getBreakLength());

        for(int i=crConf.getBreakStartTime()+crConf.getBreakLength();i<crConf.getEndTime();i+=crConf.getClassUnitTime()){
            classRoutine[0][j++]= Utility.convertMinutesToHourAndMinutes(i) + "<------>" + Utility.convertMinutesToHourAndMinutes(i+crConf.getClassUnitTime());
        }

        Iterator<String> itr = routineListByDay.keySet().iterator();
        while (itr.hasNext()){
            String key = itr.next();
            List<CourseRoutine> courseRoutineList = routineListByDay.get(key);
            int routineIndex = dayIndexMap.get(key);
            for(CourseRoutine courseRoutine:courseRoutineList){
                int pos = courseRoutine.getPosition();
                if(pos>=breakIndex)pos++;
                classRoutine[routineIndex][pos] = courseRoutine.getCourse().getCourseId()+"";
            }
        }

        map.addAttribute("clazz", clazzService.getClassById(classId));
        map.addAttribute("classRoutine", classRoutine);
        map.addAttribute("courseMap", courseMap);
        return "course/ClazzRoutine";
    }
    @RequestMapping(value = "/private/addUpdateCourseRoutine.web",
            method = RequestMethod.POST)
    public String saveCourseRoutine(@ModelAttribute("courseRoutine") CourseRoutine courseRoutine, RedirectAttributes redirectAttributes,@RequestParam("classId") Integer classId)
    {
        courseService.saveOrUpdate(courseRoutine);
        return "redirect: addUpdateCourseRoutine.web?classId=" + classId;
    }



}
