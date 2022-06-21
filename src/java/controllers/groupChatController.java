package controllers;

import POJOFiles.Groupchat;
import POJOFiles.Users;
import dbUtil.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class groupChatController {

    SessionFactory sf;
    Session ses;

    public groupChatController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public void saveMeassage(String username, String msg) {
        ses = sf.openSession();
        Transaction tr = ses.beginTransaction();

        Groupchat gp = new Groupchat();
        gp.setUsername(username);
        gp.setContent(msg);
        gp.setCratedTime(new Date(System.currentTimeMillis()));
        gp.setIsActive(1);

        ses.save(gp);

        tr.commit();
        ses.flush();
        ses.close();

    }

    public List<Groupchat> getAllMsgs() {

        ses = sf.openSession();

        Criteria cr = ses.createCriteria(Groupchat.class);

        List listData = cr.list();
        ses.flush();
        ses.close();

        return listData;

    }

//    public static void main(String[] args) {
////        groupChatController aj = new groupChatController();
////        aj.saveMeassage("kushada99", "helloooo Budddyyyyyy");
//
//        List<Groupchat> cl = new groupChatController().getAllMsgs();
//
//        for (int i = 0; i < cl.size(); i++) {
//            Groupchat get = cl.get(i);
//
//            System.out.print(get.getUsername() + " / ");
//            System.out.print(get.getContent() + " / ");
//            System.out.println(get.getCratedTime());
//
//        }
//    }

}
