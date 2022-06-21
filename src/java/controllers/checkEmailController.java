package controllers;

import POJOFiles.Users;
import dbUtil.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

public class checkEmailController {

    SessionFactory sf;
    Session ses;

    public checkEmailController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public boolean isUser(String email) {
        boolean result;
        ses = sf.openSession();

        Criteria criteria = ses.createCriteria(Users.class);
        criteria.add(Restrictions.eq("email", email));

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
