package com.school.common.dao.impl;

import com.school.util.DaoResult;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

@Component
public abstract class CommonDaoImpl{

    protected SessionFactory sessionFactory;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    
    public <E,I extends Serializable> E  getById(Class entityClass,I id) {
        return (E)getCurrentSession().get(entityClass,id);
    }
    
    public <E> void saveOrUpdate(E e) throws Exception{
            getCurrentSession().saveOrUpdate(e);
    }

    
    public<E> void delete(E e) throws Exception{
        getCurrentSession().delete(e);
    }

    
    public<E> List<E> findByCriteria(Class entityClass,Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);
        return (List<E>)criteria.list();
    }

    public Criteria getCriteria(Class entityClass,Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);
        return criteria;
    }
    public <E> List<E> getPaginatedData(Class entityClass,List<Criterion> criterionList, int offset, int limit) {

        return getCriteria(entityClass,criterionList).setFirstResult(offset).setMaxResults(limit).list();
    }

    public Criteria getCriteria(Class entityClass) {

        return getCurrentSession().createCriteria(entityClass);
    }

    public Criteria getCriteria(Class entityClass, List<Criterion> criterionList) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        for(Criterion criterion : criterionList){
            criteria.add(criterion);
        }
        return criteria;
    }
    public<E> List<E> findByCriteriaList(Class entityClass, List<Criterion> criterionList) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        for(Criterion criterion : criterionList){
            criteria.add(criterion);
        }
        return (List<E>)criteria.list();
    }


    public<E> List<E> getAll(Class entityClass) {
        return getCurrentSession().createQuery(" from " + entityClass.getSimpleName()).setMaxResults(100).list();
    }

    public<E> List<E> getAllWithOpenSession(Class entityClass) {
        Session session = sessionFactory.openSession();
        try{
            return session.createQuery(" from " + entityClass.getSimpleName()).list();

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                session.close();

            }catch (Exception e){
            }
        }
        return null;
    }

    public Query getQuery(String hql) {
        return getCurrentSession().createQuery(hql);
    }
    public<E> List<E> getByHql(String hql) {
        return getCurrentSession().createQuery(hql).list();
    }
   public<E> E getUniqueByHql(String hql) throws Exception{
        List<E> data = getCurrentSession().
                            createQuery(hql).
                                    list();
        return data.size()==1? (E)data.get(0):null;
    }

   public<E> E findByUniqueCriteria(Class entityClass,Criterion criterion) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        criteria.add(criterion);

        return  (E)criteria.uniqueResult();
    }

   public<E> E findByUniqueCriteriaList(Class entityClass,List<Criterion> criterionList) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        for(Criterion criterion : criterionList){
            criteria.add(criterion);
        }
        return  (E)criteria.uniqueResult();
    }

   public<I>  Criteria getInCriteria(Class entityClass, String fieldName, List<I> values) {

       Criteria criteria = getCurrentSession().createCriteria(entityClass);
       Disjunction disjunction = Restrictions.disjunction();
       for( I i: values){
           disjunction.add(Restrictions.eq(fieldName,i));
       }
       criteria.add(disjunction);
        return criteria;
    }

   public<E,I>  List<E> in(Class entityClass, String fieldName, List<I> values) {

        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        Disjunction disjunction = Restrictions.disjunction();
        for( I i: values){
            disjunction.add(Restrictions.eq(fieldName,i));
        }
        criteria.add(disjunction);
        return  (List<E>)criteria.list();
    }

/*
    public DaoResult updateSingle(Class entityClass ,String filedName, Object value){
        Query query = getQuery(" update " + entityClass.getSimpleName() + " set " + filedName + "=:field");
        query.setParameter("field", value);
        query.executeUpdate();
        return new DaoResult();

    }
*/





}
