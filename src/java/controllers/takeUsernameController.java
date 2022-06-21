
package controllers;

import POJOFiles.Users;
import dbUtil.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

public class takeUsernameController {
    SessionFactory sf;
    Session ses;

    public takeUsernameController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }
    
    public Users getUsername(int uid){
    
        ses = sf.openSession();
        Criteria ct = ses.createCriteria(Users.class);
        ct.add(Restrictions.eq("idusers", uid));
        
        Users user = (Users)ct.uniqueResult();
        
        ses.flush();
        ses.close();
        
        return user;
    }
    
//    public static void main(String[] args) {
//        takeUsernameController um = new takeUsernameController();
//        Users user = um.getUsername(35);
//        
//        System.out.println(user.getUsername());
//    }
}
