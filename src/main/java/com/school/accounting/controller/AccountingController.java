package com.school.accounting.controller;

import com.school.accounting.model.SalaryInfo;
import com.school.accounting.service.AccountingService;
import com.school.common.service.CommonService;
import com.school.login.service.LoginService;
import com.school.menu.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */


@Controller
@ComponentScan("com.school.accounting.service")
public class AccountingController {

   @Autowired
   CommonService commonService;

   @Autowired
   LoginService loginService;

    @RequestMapping(value = "/admin/private/addUpdateSalary.web", method = RequestMethod.GET)
    public String initSalary(@RequestParam(value = "userId", required = false)Integer userId,ModelMap map){
        SalaryInfo salaryInfo = null;
        if(userId==null){
            salaryInfo = new SalaryInfo();
        }else {
            salaryInfo = commonService.getById(SalaryInfo.class,userId);
        }
        map.addAttribute("salaryInfo",salaryInfo);
        map.addAttribute("employeeList",loginService.getEmployeeUsers());
        return "accounting/addUpdateSalary";
    }
    @RequestMapping(value = "/admin/private/addUpdateSalary.web", method = RequestMethod.POST)
    public String addUpdateSalary(@ModelAttribute("salaryInfo")SalaryInfo salaryInfo, RedirectAttributes redirectAttributes){
        commonService.saveOrUpdate(salaryInfo);
        return "redirect:addUpdateSalary.web?userId=" + salaryInfo.getUserId();
    }

    @RequestMapping(value = "/admin/private/viewSalary.web", method = RequestMethod.GET)
    public String viewSalary(ModelMap map){
        map.addAttribute("salaryList", commonService.getAll(SalaryInfo.class));
        return "accounting/viewSalary";
    }


}
