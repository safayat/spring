package com.mkyong.common;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;

/**
 * Created by safayat on 10/21/14.
 */
public class OpenSessionInViewFilter extends org.springframework.orm.hibernate3.support.OpenSessionInViewFilter{
    @Override
    protected Session getSession(SessionFactory sessionFactory)	throws DataAccessResourceFailureException {
        Session session = SessionFactoryUtils.getSession(sessionFactory, true);
        session.setFlushMode(FlushMode.AUTO);
        return session;
    }

    @Override
    protected void closeSession(Session session, SessionFactory sessionFactory) {
        try {
            if (isSessionActive(session)) {
                session.flush();
            }
        } finally {
            super.closeSession(session, sessionFactory);
        }
    }

    boolean isSessionActive(Session session) {
        return session != null && session.isOpen() && session.isConnected();
    }

}
