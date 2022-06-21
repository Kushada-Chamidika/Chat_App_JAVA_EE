package controllers;

import POJOFiles.Groupchat;
import POJOFiles.Individualchat;
import POJOFiles.Users;
import com.mchange.v2.ser.IndirectPolicy;
import dbUtil.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class privateChatController {

    SessionFactory sf;
    Session ses;

    public privateChatController() {

        sf = HibernateUtil.getSessionFactory();
        ses = sf.openSession();

    }

    public void saveMeassage(String Recname, String username, String msg) {
        ses = sf.openSession();

        Transaction tr = ses.beginTransaction();

        Individualchat gp = new Individualchat();
        gp.setSenderUname(username);
        gp.setReceiverUname(Recname);
        gp.setContent(msg);
        gp.setCreatedTime(new Date(System.currentTimeMillis()));
        gp.setIsActive(1);

        ses.save(gp);

        tr.commit();
        ses.flush();
        ses.close();

    }

    public List<Individualchat> getAllSendMsgs(String Recname, String username) {

        Criteria cr = ses.createCriteria(Individualchat.class);
        cr.add(Restrictions.eq("senderUname", username));
        cr.add(Restrictions.eq("receiverUname", Recname));

        List listData = cr.list();
       
        
        return listData;

    }

    public List<Individualchat> getAllReceivedMsgs(String Recname, String username) {

        Criteria cr = ses.createCriteria(Individualchat.class);
        cr.add(Restrictions.eq("receiverUname", username));
        cr.add(Restrictions.eq("senderUname", Recname));

        List listData = cr.list();
        ses.flush();

        return listData;

    }

    public List<Individualchat> getAllMsgs(String Recname, String username) {

        List<Individualchat> finalChat = new ArrayList<>();

        ses = sf.openSession();

        List<Individualchat> send = getAllSendMsgs(Recname, username);

        if (send.isEmpty()) {

        } else {
            for (int i = 0; i < send.size(); i++) {
                Individualchat get = send.get(i);
                String senderUnmae = get.getSenderUname();
                String recUnmae = get.getReceiverUname();
                String content = get.getContent();
                Date date = get.getCreatedTime();

                Individualchat cht = new Individualchat();
                cht.setSenderUname(senderUnmae);
                cht.setReceiverUname(recUnmae);
                cht.setContent(content);
                cht.setCreatedTime(date);

                finalChat.add(cht);

            }
        }
      

        List<Individualchat> received = getAllReceivedMsgs(Recname, username);

        if (received.isEmpty()) {

        } else {
            for (int i = 0; i < received.size(); i++) {
                Individualchat get = received.get(i);
                String senderUnmae = get.getSenderUname();
                String recUnmae = get.getReceiverUname();
                String content = get.getContent();
                Date date = get.getCreatedTime();

                Individualchat cht = new Individualchat();
                cht.setSenderUname(senderUnmae);
                cht.setReceiverUname(recUnmae);
                cht.setContent(content);
                cht.setCreatedTime(date);

                finalChat.add(cht);
            }
        }
        ses.flush();
        ses.close();

        return finalChat;

    }

//    public static void main(String[] args) {
//        privateChatController pv = new privateChatController();
//        pv.saveMeassage("saman98", "kushada99", "Helloooooooo");
//        List<Individualchat> data = pv.getAllSendMsgs("kushada99", "saman98");
//       List<Individualchat> data = pv.getAllReceivedMsgs("kushada99", "saman98");
//        List<Individualchat> data = pv.getAllMsgs("kushada99", "saman98");
//
//        for (int i = 0; i < data.size(); i++) {
//            Individualchat get = data.get(i);
//            System.out.print(get.getSenderUname() + "/");
//            System.out.print(get.getReceiverUname() + "/");
//            System.out.println(get.getContent());
//
//        }
//    }
}
