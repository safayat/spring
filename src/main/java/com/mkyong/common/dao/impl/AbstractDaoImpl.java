package com.mkyong.common.dao.impl;

import com.mkyong.common.dao.AbstractDAO;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.List;


public abstract class AbstractDaoImpl<E, I extends Serializable> implements AbstractDAO<E,I> {
    private Class<E> entityClass;

    protected SessionFactory sessionFactory;


    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public E findById(I id) {
        return (E) getCurrentSession().get(entityClass, id);
    }
    @Override
    public void saveOrUpdate(E e) throws Exception{
            getCurrentSession().saveOrUpdate(e);
    }

    @Override
    public void delete(E e) throws Exception{
        getCurrentSession().delete(e);
    }

    @Override
    public List<E> findByCriteria(Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);
        return criteria.list();
    }

    @Override
    public List<E> getAll() {
        return getCurrentSession().createQuery(" from " + entityClass.getSimpleName()).list();
    }

    @Override
     public E findByUniqueCriteria(Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);
        return (E) criteria.uniqueResult();
    }

    public void setEntityClass(Class<E> entityClass) {
        this.entityClass = entityClass;
    }
}
