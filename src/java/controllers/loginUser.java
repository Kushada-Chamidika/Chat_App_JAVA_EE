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

public class loginUser {

    SessionFactory sf;
    Session ses;

    public loginUser() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public Users userLogin(String username, String password) {
        Users userOutput = null;
        ses = sf.openSession();
        Criteria cr = ses.createCriteria(Users.class);
        cr.add(Restrictions.eq("username", username));
        cr.add(Restrictions.eq("password", password));
        List<Users> user = cr.list();

        if (user.isEmpty()) {
            userOutput = new Users();
            userOutput.setIdusers(-1);
            return userOutput;
        } else {
            userOutput = new Users();
            int id = 0;
            String email = "";

            for (int i = 0; i < user.size(); i++) {
                Users get = user.get(i);
                userOutput.setIdusers(get.getIdusers());
                userOutput.setFullname(get.getFullname());
                userOutput.setUsername(get.getUsername());
                userOutput.setEmail(get.getEmail());

                Criteria cr2 = ses.createCriteria(Activestatus.class);
                cr2.add(Restrictions.eq("email", get.getEmail()));
                Activestatus stat = (Activestatus) cr2.uniqueResult();
                id = stat.getIdactiveStatus();
                email = stat.getEmail();

            }

            ses.flush();
            ses.close();

            ses = sf.openSession();

            Transaction trans = ses.beginTransaction();

            Activestatus act = new Activestatus();

            act.setIdactiveStatus(id);
            act.setEmail(email);
            act.setStatus("Active");
            act.setLastSeen(new Date(System.currentTimeMillis()));
            act.setIsActive(1);

            ses.update(act);

            trans.commit();

            ses.flush();
            ses.close();

            return userOutput;
        }

    }

//    public static void main(String[] args) {
//
//        loginUser login = new loginUser();
//        Users user = login.userLogin("saman9scdf8", "6789");
//
//        if (user.getIdusers() > 0) {
//            System.out.println(user.getEmail());
//        } else {
//            System.out.println("No User");
//        }
//
//    }

}
