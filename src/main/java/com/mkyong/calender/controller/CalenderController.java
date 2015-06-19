package com.mkyong.calender.controller;

import com.mkyong.calender.model.Vacation;
import com.mkyong.calender.service.CalenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by safayat on 2/3/15.
 */


@Controller
@ComponentScan("com.mkyong.calender.service")
public class CalenderController {

   @Autowired
   CalenderService calenderService;

    @RequestMapping(value = "/admin/private/addUpdateVaction.web", method = RequestMethod.GET)
    public String initVacation(@RequestParam(value = "vacationId", required = false)Integer vacationId, ModelMap map){
        Vacation vacation = null;
        if(vacationId==null){
            vacation = new Vacation();
        }else{
            vacation = calenderService.getVacation(vacationId);
        }
        map.addAttribute("vacation", vacation);
        return "calender/addUpdateVaction";
    }

    @RequestMapping(value = "/private/viewVacation.web", method = RequestMethod.GET)
    public String viewVacation(ModelMap map){
        map.addAttribute("vacationList",calenderService.getVacationList());
        return "calender/viewVacation";
    }

    @RequestMapping(value = "/private/academicCalender.web", method = RequestMethod.GET)
    public String academicCalender(ModelMap map){
        return "calender/academicCalender";
    }

    @RequestMapping(value = "/admin/private/addUpdateVaction.web", method = RequestMethod.POST)
    public String saveVacation(@ModelAttribute("vacation")Vacation vacation,RedirectAttributes redirectAttributes){

        calenderService.saveOrUpdate(vacation);
        return "redirect:addUpdateVaction.web?vacationId="+vacation.getVacationId();
    }



}
