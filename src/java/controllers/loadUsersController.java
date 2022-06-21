package controllers;

import POJOFiles.Activestatus;
import POJOFiles.Users;
import dbUtil.HibernateUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class loadUsersController {

    SessionFactory sf;
    Session ses;

    public loadUsersController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public List<Users> getAllUsers() {
        List<Users> userList = new ArrayList<>();

        ses = sf.openSession();

        Criteria cr = ses.createCriteria(Users.class);
        userList = cr.list();

        ses.flush();
        ses.close();

        return userList;
    }
    
      public List<Users> getAllActiveUsers() {
        List<Users> userList = new ArrayList<>();

        ses = sf.openSession();
        
        Criteria cr1 = ses.createCriteria(Activestatus.class);
        cr1.add(Restrictions.eq("status", "Active"));
        List<Activestatus> users = cr1.list();
        
          for (int i = 0; i < users.size(); i++) {
              Activestatus get = users.get(i);
              String email = get.getEmail();
              Criteria cr = ses.createCriteria(Users.class);
              cr.add(Restrictions.eq("email", email));
              userList.add((Users)cr.uniqueResult());
          }

        ses.flush();
        ses.close();

        return userList;
    }
    
    public List<Users> getUserlike(String name) {
        List<Users> userList = new ArrayList<>();

        ses = sf.openSession();

        Criteria cr = ses.createCriteria(Users.class);
        cr.add(Restrictions.like("fullname", name, MatchMode.ANYWHERE));
        userList = cr.list();

        ses.flush();
        ses.close();

        return userList;
    }
    
    public List<Users> getActiveUserlike(String name) {
        List<Users> userList = new ArrayList<>();

        ses = sf.openSession();

        Criteria cr = ses.createCriteria(Users.class);
        cr.add(Restrictions.like("fullname", name, MatchMode.ANYWHERE));
        List<Users> data= cr.list();
        
        for (int i = 0; i < data.size(); i++) {
            Users get = data.get(i);
            String email = get.getEmail();
            
            Criteria c = ses.createCriteria(Activestatus.class);
            c.add(Restrictions.eq("email", email));
            c.add(Restrictions.eq("status", "Active"));
            List<Activestatus> dataList = c.list();
            
            for (int j = 0; j < dataList.size(); j++) {
                Activestatus get1 = dataList.get(j);
                String emailActiveUser = get1.getEmail();
                
                Criteria cd = ses.createCriteria(Users.class);
                cd.add(Restrictions.eq("email", emailActiveUser));
                userList.add((Users)cd.uniqueResult());
            }
            
        }

        ses.flush();
        ses.close();

        return userList;
    }

//    public static void main(String[] args) {
//        loadUsersController um = new loadUsersController();
////        List<Users> data = um.getAllUsers();
////        List<Users> data = um.getUserlike("Kushada Chamidika");
//        List<Users> data = um.getAllActiveUsers();
//      //  List<Users> data = um.getActiveUserlike("ku");
//
//        for (Iterator<Users> iterator = data.iterator(); iterator.hasNext();) {
//            Users next = iterator.next();
//
//            String id = String.valueOf(next.getIdusers());
//            String name = next.getFullname();
//
//            System.out.print(id + " / ");
//            System.out.println(name);
//
//        }
//    }
}
