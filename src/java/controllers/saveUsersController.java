package controllers;

import POJOFiles.Activestatus;
import POJOFiles.Users;
import dbUtil.HibernateUtil;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class saveUsersController {

    SessionFactory sf;
    Session ses;

    public saveUsersController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public boolean saveUsers(String fname, String email, String username, String password) {

        try {
            ses = sf.openSession();
            Transaction trl = ses.beginTransaction();

            Users ur = new Users();
            ur.setFullname(fname);
            ur.setEmail(email);
            ur.setUsername(username);
            ur.setPassword(password);
            ur.setDateCreated(new Date(System.currentTimeMillis()));
            ur.setIsActive(1);

            ses.save(ur);

            Activestatus as = new Activestatus();
            as.setEmail(email);
            as.setStatus("Inactive");
            as.setLastSeen(new Date(System.currentTimeMillis()));
            as.setIsActive(1);

            ses.save(as);

            trl.commit();
            ses.flush();
            ses.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;

    }

//    public static void main(String[] args) {
//        saveUsersController sv = new saveUsersController();
//        sv.saveUsersController("Kushada Chamidika", "1999kushada@gmail.com", "kushada99", "12345");
//    }
}
