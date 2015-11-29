package com.school.clazz.service;

import com.school.clazz.dao.ClazzDAO;
import com.school.clazz.model.Attendance;
import com.school.clazz.model.ClassRoutineConfiguration;
import com.school.clazz.model.Clazz;
import com.school.clazz.model.RollCall;
import com.school.course.model.Course;
import com.school.course.model.CourseRoutine;
import com.school.login.model.Login;
import com.school.user.model.Student;
import com.school.user.model.Teacher;
import com.school.util.CriteriaContainer;
import com.school.util.DaoResult;
import com.school.util.StringUtility;
import com.school.util.Utility;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
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
    public List<Clazz> getClassList(boolean includeClassTeacher, boolean includeClassCaptain, boolean studentCount){
        List<Clazz> clazzList = clazzDAO.getAll(Clazz.class);

        if(includeClassTeacher){
            List<Integer> teacherIdList = new ArrayList<>();
            for(Clazz clazz : clazzList){
                if(clazz.getClassTeacherId() != null){
                    teacherIdList.add(clazz.getClassTeacherId());
                }
            }
            if(teacherIdList.size()>0){
                List<Teacher> teacherList = clazzDAO.findByCriteria(Teacher.class, Restrictions.in("teacherId", teacherIdList));
                Map<Integer, Teacher> teacherMap = new HashMap<>();
                for(Teacher teacher : teacherList){
                    teacherMap.put(teacher.getTeacherId(),teacher);
                }

                for(Clazz clazz : clazzList){
                    if(clazz.getClassTeacherId() !=  null){
                        clazz.setClassTeacher(teacherMap.get(clazz.getClassTeacherId()));
                    }
                }

            }
        }

        if(includeClassCaptain){
            List<Integer> studentIdList = new ArrayList<>();
            for(Clazz clazz : clazzList){
                if(clazz.getClassCaptainId() != null){
                    studentIdList.add(clazz.getClassCaptainId());
                }
            }
            if(studentIdList.size()>0){
                List<Student> studentList = clazzDAO.findByCriteria(Student.class, Restrictions.in("studentId", studentIdList));
                Map<Integer, Student> studentMap = new HashMap<>();
                for(Student student : studentList){
                    studentMap.put(student.getStudentId(),student);
                }

                for(Clazz clazz : clazzList){
                    if(clazz.getClassCaptainId() !=  null){
                        clazz.setClassCaptain(studentMap.get(clazz.getClassCaptainId()));
                    }
                }
            }

        }

        if(studentCount){
            Map<Integer,String> studentCountMap = getClassStudentCount();
            for(Clazz clazz : clazzList){
                String count = studentCountMap.get(clazz.getClassId());
                if(count == null) count = "0";
                clazz.setStudentCount(Integer.parseInt(count));
            }

        }

        return clazzList;
    }
    @Transactional
    public List<Clazz> getClassListWithOpenSession(){
        return clazzDAO.getAllWithOpenSession(Clazz.class);
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
        Clazz clazz = clazzDAO.getById(Clazz.class,id);
        if(eager){
            clazz.getStudentList().size();
        }
        return clazz;
    }

    @Transactional
    public ClassRoutineConfiguration getClassRoutineConfigByClassId(Integer id){
        try{
//            return clazzDAO.getUniqueByHql(" from " + ClassRoutineConfiguration.class.getSimpleName() + " where classId = " + id);
            return clazzDAO.findByUniqueCriteria(ClassRoutineConfiguration.class, Restrictions.eq("classId", id));

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
            return clazzDAO.findByUniqueCriteriaList(Clazz.class,
                    CriteriaContainer.get().
                    add(Restrictions.eq("rollCallDate",date)).
                    add(Restrictions.eq("classId",classId)).
                    list());
        }catch (Exception e){

        }
        return null;
    }

    @Transactional
    public List<Attendance>  getIndividualAttendanceHistoryByDate(Integer studentId, Date formDate, Date toDate){
        try{
            return clazzDAO.findByCriteriaList(Attendance.class,
                    CriteriaContainer.get().add(Restrictions.eq("studentId",studentId))
                            .add(Restrictions.between("attDate", formDate, toDate))
                                    .list());
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    @Transactional
    public List<Date>  getIndividualAbsenceHistoryByDate(Integer studentId, Date formDate, Date toDate) throws  Exception{
        Student student = clazzDAO.getById(Student.class, studentId);
        List<RollCall> rollCallList = clazzDAO.findByCriteriaList(RollCall.class,
                        CriteriaContainer.get().
                        add(Restrictions.eq("classId", student.getClassId())).
                        add(Restrictions.between("rollCallDate", formDate, toDate)).
                        list());

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

    public String[][] getInitializedCourseRoutine(ClassRoutineConfiguration crConf){
        String[] dayList = {"","sun","mon","tue","wed","thu"};
        String[][] classRoutine = new String[6][];
        int clazzCount = crConf.getClazzCount();
        final int TH = 0;
        final int COL1 = 0;
        for(int i=0;i<6;i++)
            classRoutine[i]=new String[clazzCount+2];
        int breakIndex = crConf.getBreakIndex();
        for(int i=1;i<6;i++)
            classRoutine[i][breakIndex]="-1";
        for(int i=0;i<6;i++)
            classRoutine[i][COL1]= dayList[i];
        int col=1;
        final String INTERVAL =  "<------>";
        for(int min=crConf.getStartTime();min<crConf.getBreakStartTime();min+=crConf.getClassUnitTime()){
            classRoutine[TH][col++]= Utility.toHourMinutes(min) + INTERVAL + Utility.toHourMinutes(min+crConf.getClassUnitTime());
        }
        classRoutine[TH][col++]= Utility.toHourMinutes(crConf.getBreakStartTime()) + INTERVAL + Utility.toHourMinutes(crConf.getBreakStartTime()+crConf.getBreakLength());

        for(int min=crConf.getBreakStartTime()+crConf.getBreakLength();min<crConf.getEndTime();min+=crConf.getClassUnitTime()){
            classRoutine[TH][col++]= Utility.toHourMinutes(min) + INTERVAL + Utility.toHourMinutes(min+crConf.getClassUnitTime());
        }
        return classRoutine;
    }

    @Transactional
    public String[][] populateCourseRoutine(List<Course> courseList, int classId){
        ClassRoutineConfiguration crConf = getClassRoutineConfigByClassId(classId);
        String[][] classRoutine = getInitializedCourseRoutine(crConf);
        Map<String,Integer> dayIndexMap = new HashMap();
        dayIndexMap.put("sun",1);
        dayIndexMap.put("mon",2);
        dayIndexMap.put("tue",3);
        dayIndexMap.put("wed",4);
        dayIndexMap.put("thu",5);

        Map<String, List<CourseRoutine>> routineListByDay = new HashMap<>();
        for(Course course:courseList){
            for(CourseRoutine routine:course.getCourseRoutineList()){
                List<CourseRoutine> courseRoutines = routineListByDay.get(routine.getDay());
                if(courseRoutines ==null){
                    courseRoutines = new ArrayList<>();
                    routineListByDay.put(routine.getDay(), courseRoutines);
                }
                courseRoutines.add(routine);
            }
        }

        Iterator<String> itr = routineListByDay.keySet().iterator();
        while (itr.hasNext()){
            String key = itr.next();
            List<CourseRoutine> courseRoutineList = routineListByDay.get(key);
            int routineIndex = dayIndexMap.get(key);
            for(CourseRoutine courseRoutine:courseRoutineList){
                int pos = courseRoutine.getPosition();
                if(pos>=crConf.getBreakIndex())pos++;
                classRoutine[routineIndex][pos] = courseRoutine.getCourse().getCourseId()+"";
            }
        }

        return classRoutine;
    }

    @Transactional
    public boolean saveOrUpdate(Clazz clazz){

        try {
            clazzDAO.saveOrUpdate(clazz);
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
        return true;
    }

    @Transactional
    public Object[] getSections(){
        return clazzDAO.getSqlQuery("select sectionName from sections").list().toArray();
    }

    @Transactional
    public DaoResult addSection(String section){
        clazzDAO.getSqlQuery("insert ignore into sections(sectionName) values(" + StringUtility.toQoute(section) + ")").executeUpdate();
        return new DaoResult();
    }

    @Transactional
    public DaoResult addShift(String shift){
        clazzDAO.getSqlQuery("insert ignore into shifts(shiftName) values(" + StringUtility.toQoute(shift) + ")").executeUpdate();
        return new DaoResult();
    }

    @Transactional
    public Object[] getShifts(){
        return clazzDAO.getSqlQuery("select shiftName from shifts").list().toArray();
    }



}
