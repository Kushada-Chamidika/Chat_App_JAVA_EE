package controllers;

import POJOFiles.Users;
import dbUtil.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

public class checkUsernameController {

    SessionFactory sf;
    Session ses;

    public checkUsernameController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public boolean isUser(String username) {
        boolean result;
        ses = sf.openSession();

        Criteria criteria = ses.createCriteria(Users.class);
        criteria.add(Restrictions.eq("username", username));

        Users users = (Users) criteria.uniqueResult();

        if (users != null) {
            result = true;
        } else {
            result = false;
        }

        ses.flush();
        ses.close();
        
        return result;
    }

}
