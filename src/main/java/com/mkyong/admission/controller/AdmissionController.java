package com.mkyong.admission.controller;

import com.mkyong.admission.model.AdmissionApplication;
import com.mkyong.admission.service.AdmissiongService;
import com.mkyong.clazz.service.ClazzService;
import com.mkyong.exam.service.ExamService;
import com.mkyong.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by safayat on 2/3/15.
 */


@Controller
@ComponentScan("com.mkyong.admission.service")
public class AdmissionController {

    @Autowired
    AdmissiongService admissionService;

    @Autowired
    ExamService examService;

    @Autowired
    ClazzService clazzService;

    @RequestMapping(method = RequestMethod.GET,value = "addmissionForm.web")
    public  String initAddmissionForm(ModelMap map){
        map.addAttribute("addmissionForm",new AdmissionApplication());
        map.addAttribute("classList",clazzService.getClassList());
        return "admission/addmissionForm";
    }

    @RequestMapping(method = RequestMethod.GET,value = "viewAddmissionApplications.web")
    public  String viewAddmissionApplications(ModelMap map){
        map.addAttribute("viewAddmissionApplications",admissionService.getAll());
        return "admission/viewAddmissionApplications";
    }

    @RequestMapping(method = RequestMethod.POST,value = "addmissionForm.web")
    public  String saveAddmissionForm(@ModelAttribute("addmissionForm")AdmissionApplication admissionApplication, RedirectAttributes redirectAttributes){
        admissionApplication.setAdmissionYear(Utility.getCurrentDateInfo(Calendar.YEAR));
        admissionService.saveOrUpdate(admissionApplication);
        return "redirect:admission.web";
    }

    @RequestMapping(value = "admission.web",
            method = RequestMethod.GET)
    public String admissionInfo()
    {
        return "common/admission";
    }

    @RequestMapping(value = "viewSeatPlan.web",
            method = RequestMethod.GET)
    public String viewSeatPlan(ModelMap map, @RequestParam("examId")Integer examId )
    {
        map.addAttribute("seatPlan",examService.getAllAdmissionSeatPlan(examId));
        return "admission/viewSeatPlan";
    }



}
