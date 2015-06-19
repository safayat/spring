package com.mkyong.common.service;

import com.mkyong.admission.dao.AdmissionDAO;
import com.mkyong.admission.model.AdmissionApplication;
import com.mkyong.common.dao.CommonDAO;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class CommonService {
    @Autowired
    CommonDAO commonDAO;

    @Transactional
    public <E,I extends Serializable> E  getById(Class entityClass,I id) {
        return commonDAO.getById(entityClass,id);
    }

    @Transactional
    public <E> void saveOrUpdate(E e){
        try{
            commonDAO.saveOrUpdate(e);
        }catch (Exception exp){
            exp.printStackTrace();
        }

    }


    @Transactional
    public<E> void delete(E e){
        try{

            commonDAO.delete(e);
        }catch (Exception exp){
            exp.printStackTrace();
        }
    }

    @Transactional
    public<E> List<E> getAll(Class entityClass) {
        return commonDAO.getAll(entityClass);
    }

/*
    @Transactional
    public<E> List<E> getByHql(String hql) {
        return commonDAO.getByHql(hql);
    }
    @Transactional
    public<E> E getUniqueByHql(String hql) throws Exception{
        return commonDAO.getUniqueByHql(hql);
    }

*/

}
