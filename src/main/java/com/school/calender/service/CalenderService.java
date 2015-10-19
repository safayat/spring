package com.school.calender.service;

import com.school.calender.dao.CalendarDAO;
import com.school.calender.model.Vacation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class CalenderService {
    @Autowired
    CalendarDAO calendarDAO;

    @Transactional
    public Vacation getVacation(Integer id){
        return calendarDAO.getById(Vacation.class,id);
    }

    @Transactional
    public List<Vacation> getVacationList(){
        return calendarDAO.getAll(Vacation.class);
    }

    @Transactional
    public void saveOrUpdate(Vacation vacation){
        try {
            calendarDAO.saveOrUpdate(vacation);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
