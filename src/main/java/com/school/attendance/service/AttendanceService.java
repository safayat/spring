package com.school.attendance.service;

import com.school.attendance.dao.AttendanceDAO;
import com.school.attendance.model.EmployeeAttendance;
import com.school.clazz.dao.ClazzDAO;
import com.school.clazz.model.Attendance;
import com.school.clazz.model.ClassRoutineConfiguration;
import com.school.clazz.model.Clazz;
import com.school.clazz.model.RollCall;
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
public class AttendanceService {
    @Autowired
    AttendanceDAO attendanceDAO;

    @Transactional
    public void  saveAttendance(List<EmployeeAttendance> employeeAttendanceList) throws Exception{
        for(EmployeeAttendance employeeAttendance:employeeAttendanceList){
            attendanceDAO.saveOrUpdate(employeeAttendance);
        }

    }

    @Transactional
    public List<EmployeeAttendance>  getAttendanceList(Date fromDate, Date toDate, Integer userId) {

        if(fromDate==null) fromDate = new Date();
        if(toDate==null) toDate = fromDate;
        String hql = " from " + EmployeeAttendance.class.getSimpleName() + " where rollCallDate between '" + Utility.formatter.format(fromDate) + "' and '" + Utility.formatter.format(toDate) + "'";
        if(userId>0){
            hql = hql + " and userId = " + userId;
        }
        return attendanceDAO.getByHql(hql);
    }
}
