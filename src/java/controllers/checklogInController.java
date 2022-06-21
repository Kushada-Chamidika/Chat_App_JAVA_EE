package controllers;

import POJOFiles.Activestatus;
import POJOFiles.Users;
import dbUtil.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class checklogInController {

    SessionFactory sf;
    Session ses;

    public checklogInController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public boolean chekUserStatus(String username) {
        boolean result = true;
        ses = sf.openSession();

        Criteria cr1 = ses.createCriteria(Users.class);
        cr1.add(Restrictions.eq("username", username));
        List<Users> user = cr1.list();

        if (user.isEmpty()) {
            result = false;
        } else {
            String email = "";
            for (int i = 0; i < user.size(); i++) {
                Users get = user.get(i);
                email = get.getEmail();
            }

            Criteria cr = ses.createCriteria(Activestatus.class);
            cr.add(Restrictions.eq("email", email));
            Activestatus act = (Activestatus) cr.uniqueResult();

            String status = act.getStatus();

            if (status.equals("Active")) {
                result = true;
            } else {
                result = false;
            }
        }
        ses.flush();
        ses.close();
        return result;
    }

//    public static void main(String[] args) {
//        checklogInController controller = new checklogInController();
//        System.out.println(controller.chekUserStatus("kushada99"));
//    }

}
