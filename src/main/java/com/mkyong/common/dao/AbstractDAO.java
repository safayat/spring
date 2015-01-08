package com.mkyong.common.dao;

import org.hibernate.criterion.Criterion;

import java.io.Serializable;
import java.util.List;

/**
 * Created by safayat on 4/25/14.
 */
public interface AbstractDAO<E,I extends Serializable> {

    E findById(I id);
    void saveOrUpdate(E e) throws Exception;
    void delete(E e) throws Exception;
    List<E> findByCriteria(Criterion criterion);
     E findByUniqueCriteria(Criterion criterion);
    List<E> getAll();
}
