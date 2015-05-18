package com.mkyong.util;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;

/**
 * Created by safayat on 7/21/14.
 */
public class HibernateAwareObjectMapper extends ObjectMapper{
    public HibernateAwareObjectMapper() {
        System.out.println("in HibernateAwareObjectMapper");
        registerModule(new Hibernate4Module());
    }

}
