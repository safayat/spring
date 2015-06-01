package com.mkyong.accounting.service;

import com.mkyong.accounting.dao.AccountingDAO;
import com.mkyong.accounting.model.SalaryInfo;
import com.mkyong.calender.model.Vacation;
import com.mkyong.menu.dao.MenuDAO;
import com.mkyong.menu.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class AccountingService {
    @Autowired
    AccountingDAO accountingDAO;

    @Transactional
    public SalaryInfo getSalary(Integer id){
        return accountingDAO.getById(SalaryInfo.class,id);
    }

    @Transactional
    public List<SalaryInfo> getSalaryList(){
        return accountingDAO.getAll(SalaryInfo.class);
    }

    @Transactional
    public void saveOrUpdate(SalaryInfo salaryInfo){
        try {
            accountingDAO.saveOrUpdate(salaryInfo);
        }catch (Exception e){
            e.printStackTrace();
        }
    }




}
