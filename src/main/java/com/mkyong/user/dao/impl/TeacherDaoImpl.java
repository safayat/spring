package com.mkyong.user.dao.impl;

import com.mkyong.common.dao.impl.CommonDaoImpl;
import com.mkyong.user.model.Teacher;

/**
 * Created by safayat on 2/3/15.
 */
public class TeacherDaoImpl extends CommonDaoImpl<Teacher,Integer> {
    public TeacherDaoImpl() {
        setEntityClass(Teacher.class);
    }
}
