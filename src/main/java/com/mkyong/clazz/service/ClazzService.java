package com.mkyong.clazz.service;

import com.mkyong.clazz.dao.ClazzDAO;
import com.mkyong.clazz.model.Attendance;
import com.mkyong.clazz.model.ClassRoutineConfiguration;
import com.mkyong.clazz.model.Clazz;
import com.mkyong.clazz.model.RollCall;
import com.mkyong.login.model.Login;
import com.mkyong.user.model.Student;
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
public class ClazzService {
    @Autowired
    ClazzDAO clazzDAO;

    @Transactional
    public List<Clazz> getClassList(){
        return clazzDAO.getAll(Clazz.class);
    }

    @Transactional
    public Map getClassStudentCount(){
       Iterator itr = clazzDAO.getByHql("SELECT COUNT(*),st.classId FROM " +  Student.class.getSimpleName()  + " st GROUP BY st.classId").iterator();
       Map<Integer,String> studentCountMapByClass = new HashMap<>();
       while(itr.hasNext()){
           Object[] row = (Object[])itr.next();
           studentCountMapByClass.put((Integer)row[1],row[0]+"");
       }
       return studentCountMapByClass;
    }
    @Transactional
    public Clazz getClassById(Integer id,boolean eager){
        if(eager){
            ((Clazz)clazzDAO.getById(Clazz.class,id)).getStudentList().size();
        }
        return clazzDAO.getById(Clazz.class,id);
    }

    @Transactional
    public ClassRoutineConfiguration getClassRoutineConfigByClassId(Integer id){
        try{
            return clazzDAO.getUniqueByHql(" from " + ClassRoutineConfiguration.class.getSimpleName() + " where classId = " + id);

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Transactional
    public Clazz getClassById(Integer id){
        ((Clazz)clazzDAO.getById(Clazz.class,id)).getStudentList().size();
        return clazzDAO.getById(Clazz.class,id);
    }

    @Transactional
    public void  saveRollCall(Integer classId,String[] studentList, Integer teacherId){
        try{
            Date today = new Date();
            RollCall rollCall = new RollCall();
            rollCall.setClassId(classId);
            rollCall.setRollCallDate(today);
            rollCall.setTechaerId(teacherId);
            rollCall.setClassId(classId);
            List<Attendance> attendanceList = new ArrayList<>();
            for(String id : studentList){
                Attendance attendance = new Attendance();
                attendance.setClassId(classId);
                attendance.setAttDate(today);
                attendance.setPresent(true);
                attendance.setStudentId(Integer.parseInt(id));
                attendanceList.add(attendance);
            }
            rollCall.setAttendanceList(attendanceList);
            System.out.println("att: " + rollCall.getAttendanceList().size());
            clazzDAO.saveOrUpdate(rollCall);
        }catch (Exception e){

        }
    }

    @Transactional
    public RollCall  getRollCall(Integer classId, Date date){
        try{
        return clazzDAO.getUniqueByHql(" from " + RollCall.class.getSimpleName() +
                " where rollCallDate = " + date + " and classId =" + classId);
        }catch (Exception e){

        }
        return null;
    }

    /*
    private Date attDate;
    private int studentId;
    private boolean isPresent;
    private int classId;
    private int attId;
     */
    @Transactional
    public List<Attendance>  getIndividualAttendanceHistoryByDate(Integer studentId, Date formDate, Date toDate){
        Format formatter = new SimpleDateFormat("yyyy-MM-dd");
        String from = formatter.format(formDate);
        String to = formatter.format(toDate);
        try{
            //List<DTO> dtos = session.createQuery("SELECT NEW com.example.DTO( p.name, o.name) FROM Entity o").list();

            return clazzDAO.getByHql("select New com.mkyong.clazz.model.Attendance ( att.attDate, att.studentId, att.present, att.classId, att.attId)  from " + Attendance.class.getSimpleName() + " att "+
                " where att.studentId = " + studentId + " and att.attDate between '" + from  + "' and '" + to + "'");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    @Transactional
    public List<Date>  getIndividualAbsenceHistoryByDate(Integer studentId, Date formDate, Date toDate){
        Student student = clazzDAO.getById(Student.class, studentId);
        Format formatter = new SimpleDateFormat("yyyy-MM-dd");
        String from = formatter.format(formDate);
        String to = formatter.format(toDate);
        List<RollCall> rollCallList = clazzDAO.getByHql("Select new com.mkyong.clazz.model.RollCall(rc.rollCallDate, rc.rcId)" + " from " + RollCall.class.getSimpleName() + " rc " +
                " where rc.classId = " + student.getClassId() + " and rc.rollCallDate between '" + from  + "' and '" + to + "'");

        List <Attendance> attendanceList = getIndividualAttendanceHistoryByDate(studentId, formDate, toDate);
        HashMap<Long,Long> map = new HashMap<>();
        for(Attendance attendance : attendanceList){
            map.put(attendance.getAttDate().getTime(), attendance.getAttDate().getTime());
        }

        List<Date> dateList = new ArrayList<>();
        for(RollCall rollCall : rollCallList){
            if(map.get(rollCall.getRollCallDate().getTime())==null){
                dateList.add(rollCall.getRollCallDate());
            }
        }
        System.out.println(dateList);
        return dateList;
    }



}
