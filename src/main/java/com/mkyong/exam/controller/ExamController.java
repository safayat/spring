package com.mkyong.exam.controller;

import com.mkyong.clazz.model.Clazz;
import com.mkyong.clazz.service.ClazzService;
import com.mkyong.course.model.Course;
import com.mkyong.course.service.CourseService;
import com.mkyong.exam.model.ExamGroup;
import com.mkyong.exam.model.ExamResult;
import com.mkyong.exam.service.ExamService;
import com.mkyong.user.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.mkyong.exam.service")
public class ExamController {
    @Autowired
    ExamService examService;

    @Autowired
    ClazzService clazzService;

    @Autowired
    CourseService courseService;

    @RequestMapping(value = "/edu/private/addUpdateExamGroup.web",
            method = RequestMethod.GET)
    public String initExamGroup(@RequestParam(value = "examGroupId", required = false)Integer examGroupId, ModelMap map)
    {
        if(examGroupId==null){
            map.addAttribute("examGroup", new ExamGroup() );
        }else{
            map.addAttribute("examGroup", examService.getExamGroupById(examGroupId));
        }
        map.addAttribute("classList", clazzService.getClassList());

        return "exam/addUpdateExamGroup";
    }

    @RequestMapping(value = "/edu/private/viewExamList.web",
            method = RequestMethod.GET)
    public String viewExamList(ModelMap map)
    {
        map.addAttribute("examGroupList", examService.getAllExamGroup());
        return "exam/viewExamList";
    }

    @RequestMapping(value = "/edu/private/addUpdateMarkParam.web",
            method = RequestMethod.GET)
    public String addUpdateMarkParam(ModelMap map)
    {
        List<Clazz> clazzList = clazzService.getClassList();
        Map<Integer,Clazz> clazzMap = new HashMap<>();
        for(Clazz clazz:clazzList){
            clazzMap.put(clazz.getClassId(),clazz);
        }
        List<Course> courseList = courseService.getAllCourse();
        List<ExamGroup> examGroupList = examService.getAllExamGroup();
        map.addAttribute("clazzMap", clazzMap);
        map.addAttribute("courseList", courseList);
        map.addAttribute("examGroupList", examGroupList);
        return "exam/markParam";
    }

    @RequestMapping(value = "/edu/private/viewResultParam.web",
            method = RequestMethod.GET)
    public String viewResultParam(ModelMap map)
    {
        List<Clazz> clazzList = clazzService.getClassList();
        List<ExamGroup> examGroupList = examService.getAllExamGroup();
        map.addAttribute("clazzList", clazzList);
        map.addAttribute("examGroupList", examGroupList);
        return "exam/viewResultParam";
    }

    @RequestMapping(value = "/edu/private/addUpdateExamGroup.web",
            method = RequestMethod.POST)
    public String addUpdateExamGroup(@ModelAttribute("examGroup")ExamGroup examGroup, RedirectAttributes redirectAttributes)
    {
        examService.saveOrUpdate(examGroup);
        return "redirect:addUpdateExamGroup.web?examGroupId=" + examGroup.getExamGroupId();
    }

    @RequestMapping(value = "/edu/private/addUpdateExamResult.web",
            method = RequestMethod.GET)
    public String initExamResult(@RequestParam(value = "courseId")Integer courseId,@RequestParam(value = "examGroupId")Integer examGroupId,ModelMap map)
    {

        Course course = courseService.getCourseById(courseId);
        Clazz clazz = clazzService.getClassById(course.getClassId());
        List<ExamResult> examResultList = examService.getCourseResultList(courseId, examGroupId);
        map.addAttribute("course",course);
        map.addAttribute("clazz",clazz);
        map.addAttribute("examGroup",examService.getExamGroupById(examGroupId));
        boolean newResult=false;
        Map<Integer,Student> studentMap = new HashMap();
        if(examResultList.size()==0)newResult = true;
            for(Student student:clazz.getStudentList()){
                if(newResult){
                    ExamResult examResult = new ExamResult();
                    examResult.setCourseId(courseId);
                    examResult.setExamGroupId(examGroupId);
                    examResult.setStudentId(student.getStudentId());
                    examResult.setTotalMark(100);
                    examResultList.add(examResult);
                }
                studentMap.put(student.getStudentId(),student);
            }
        map.addAttribute("examResultList", examResultList);
        map.addAttribute("studentMap", studentMap);

        return "exam/addUpdateExamResult";
    }
    @RequestMapping(value = "/edu/private/viewExamResult.web",
            method = RequestMethod.GET)
    public String viewExamResult(@RequestParam(value = "classId")Integer classId,@RequestParam(value = "examGroupId")Integer examGroupId,ModelMap map)
    {
        ExamGroup examGroup = examService.getExamGroupById(examGroupId);
        Clazz clazz = clazzService.getClassById(classId);
        List<Course> courseList = courseService.getCourseListByClassId(classId);
        Map<Integer,List<ExamResult>> studentCourseMarkMap = new HashMap<>();
        Map<Integer,Integer> studentTotalCourseMarkMap = new HashMap<>();
        Map<Integer,Student> studentMap = new HashMap();
        for(Student student:clazz.getStudentList()){
            studentMap.put(student.getStudentId(),student);
            studentTotalCourseMarkMap.put(student.getStudentId(),0);

        }
        for(Course course:courseList){
            List<ExamResult> examResultList = examService.getCourseResultList(course.getCourseId(),examGroupId);
            for(ExamResult examResult:examResultList){
                List<ExamResult> studentMarks = studentCourseMarkMap.get(examResult.getStudentId());
                if(studentMarks==null){
                    studentMarks = new ArrayList<>();
                    studentCourseMarkMap.put(examResult.getStudentId(),studentMarks);
                }
                studentMarks.add(examResult);
                Integer curTotal = studentTotalCourseMarkMap.get(examResult.getStudentId());
                studentTotalCourseMarkMap.put(examResult.getStudentId(), curTotal + examResult.getMark());

            }
        }

        map.addAttribute("studentMap", studentMap);
        map.addAttribute("courseList", courseList);
        map.addAttribute("studentCourseMarkMap", studentCourseMarkMap);
        map.addAttribute("studentTotalCourseMarkMap", studentTotalCourseMarkMap);
        map.addAttribute("examGroup", examGroup);
        map.addAttribute("clazz", clazz);

        return "exam/viewExamResult";
    }

    @RequestMapping(value = "/edu/private/addUpdateExamResult.web",
            method = RequestMethod.POST)
    public String addUpdateExamResult(@RequestParam(value = "courseId")Integer courseId,@RequestParam(value = "examGroupId")Integer examGroupId, RedirectAttributes redirectAttributes,HttpServletRequest httpServletRequest)
    {
        Enumeration<String> attrs = httpServletRequest.getParameterNames();
        System.out.println("httpServletRequest.getAttributeNames()" + httpServletRequest.getAttributeNames());
        List<ExamResult> examResults = new ArrayList<>();
        while (attrs.hasMoreElements()){

            String attribute = attrs.nextElement();
            System.out.println("attrs.nextElement():"+attribute);
            if(attribute.startsWith("student_")){
                String split[] = attribute.split("_");
                ExamResult examResult = new ExamResult();
                examResult.setExamGroupId(examGroupId);
                examResult.setCourseId(courseId);
                examResult.setTotalMark(100);
                if(!split[1].isEmpty())
                    examResult.setResultId(Integer.parseInt(split[1]));
                examResult.setStudentId(Integer.parseInt(split[2]));
                examResult.setMark(Integer.parseInt((String) httpServletRequest.getParameter(attribute)));
                examResults.add(examResult);

            }
        }
        try{
         examService.saveOrUpdate(examResults);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:addUpdateExamResult.web?courseId="+courseId+  "&examGroupId=" + examGroupId;
    }


}
