package com.mkyong.accounting.controller;

import com.mkyong.accounting.model.SalaryInfo;
import com.mkyong.accounting.service.AccountingService;
import com.mkyong.login.service.LoginService;
import com.mkyong.menu.model.Menu;
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
@ComponentScan("com.mkyong.accounting.service")
public class AccountingController {

   @Autowired
   AccountingService accountingService;

   @Autowired
   LoginService loginService;

    @RequestMapping(value = "/private/addUpdateSalary.web", method = RequestMethod.GET)
    public String initSalary(@RequestParam(value = "userId", required = false)Integer userId,ModelMap map){
        SalaryInfo salaryInfo = null;
        if(userId==null){
            salaryInfo = new SalaryInfo();
        }else {
            salaryInfo = accountingService.getSalary(userId);
        }
        map.addAttribute("salaryInfo",salaryInfo);
        map.addAttribute("employeeList",loginService.getEmployeeUsers());
        return "accounting/addUpdateSalary";
    }
    @RequestMapping(value = "/private/addUpdateSalary.web", method = RequestMethod.POST)
    public String addUpdateSalary(@ModelAttribute("salaryInfo")SalaryInfo salaryInfo, RedirectAttributes redirectAttributes){
        accountingService.saveOrUpdate(salaryInfo);
        return "redirect:addUpdateSalary.web?userId=" + salaryInfo.getUserId();
    }

    @RequestMapping(value = "/private/viewSalary.web", method = RequestMethod.GET)
    public String viewSalary(ModelMap map){
        map.addAttribute("salaryList", accountingService.getSalaryList());
        return "accounting/viewSalary";
    }


}
