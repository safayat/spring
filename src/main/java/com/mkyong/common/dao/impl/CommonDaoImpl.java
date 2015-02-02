package com.mkyong.common.dao.impl;

import com.mkyong.common.dao.AbstractDAO;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Component
public abstract class CommonDaoImpl<E, I extends Serializable> {

    protected SessionFactory sessionFactory;
    Class<E> entityClass;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    
    public E  getById(I id) {
        return (E)getCurrentSession().get(entityClass,id);
    }
    
    public void saveOrUpdate(E e) throws Exception{
            getCurrentSession().saveOrUpdate(e);
    }

    
    public void delete(E e) throws Exception{
        getCurrentSession().delete(e);
    }

    
    public List<E> findByCriteria(Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);
        return (List<E>)criteria.list();
    }

    
    public List<E> getAll() {
        return getCurrentSession().createQuery(" from " + entityClass.getSimpleName()).list();
    }

    public List<E> getByHql(String hql) {
        return getCurrentSession().createQuery(hql).list();
    }
   public E getUniqueByHql(String hql) throws Exception{
        List<E> data = getCurrentSession().
                            createQuery(hql).
                                    list();
        return data.size()==1? (E)data.get(0):null;
    }

     public E findByUniqueCriteria(Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);
        return  (E)criteria.uniqueResult();
    }

    public void setEntityClass(Class<E> entityClass) {
        this.entityClass = entityClass;
    }
}
