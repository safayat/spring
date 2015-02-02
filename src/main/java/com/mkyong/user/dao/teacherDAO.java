package com.mkyong.user.dao;

import com.mkyong.common.dao.impl.CommonDaoImpl;
import com.mkyong.user.model.Teacher;
import org.springframework.stereotype.Repository;

/**
 * Created by safayat on 2/2/15.
 */
@Repository
public class teacherDAO extends CommonDaoImpl<Teacher, Integer> {
    public teacherDAO() {
        setEntityClass(Teacher.class);
    }

}
