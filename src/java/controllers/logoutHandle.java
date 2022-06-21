package controllers;

import POJOFiles.Activestatus;
import dbUtil.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class logoutHandle {

    SessionFactory sf;
    Session ses;

    public logoutHandle() {
        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public void logoutUser(String email) {

        ses = sf.openSession();

        Criteria cr = ses.createCriteria(Activestatus.class);
        cr.add(Restrictions.eq("email", email));
        
        Activestatus act = (Activestatus) cr.uniqueResult();
        int id = act.getIdactiveStatus();
        String emailPrint = act.getEmail();
        
        ses.flush();
        ses.close();

        ses = sf.openSession();
        Transaction tr = ses.beginTransaction();
        
        Activestatus sct = new Activestatus();
        sct.setIdactiveStatus(id);
        sct.setEmail(emailPrint);
        sct.setIsActive(1);
        sct.setStatus("Inactive");
        sct.setLastSeen(new Date(System.currentTimeMillis()));
        
        ses.update(sct);
        
        tr.commit();
        ses.flush();
        ses.close();
    
    }
    
//    public static void main(String[] args) {
//        logoutHandle lg = new logoutHandle();
//        lg.logoutUser("1999kushada@gmail.com");
//    }
    
}
