package com.school.util;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;

/**
 * Created by safayat on 7/21/14.
 */
public class HibernateAwareObjectMapper extends ObjectMapper{
    public HibernateAwareObjectMapper() {
        System.out.println("in HibernateAwareObjectMapper");
        Hibernate4Module module = new Hibernate4Module();
        module.disable(Hibernate4Module.Feature.USE_TRANSIENT_ANNOTATION);
        registerModule(module);

    }

}
