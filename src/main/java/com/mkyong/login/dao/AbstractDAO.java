package com.mkyong.login.dao;

import org.hibernate.criterion.Criterion;

import java.io.Serializable;
import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface AbstractDAO<E,I extends Serializable> {

    E findById(I id);
    void saveOrUpdate(E e);
    void delete(E e);
    List<E> findByCriteria(Criterion criterion);}