package servlets;

import POJOFiles.Groupchat;
import POJOFiles.Individualchat;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import controllers.privateChatController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class privatemsgHandler extends HttpServlet {

    privateChatController cmc;

    public privatemsgHandler() {
        cmc = new privateChatController();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String recnme = req.getParameter("recnme");
        String sender = req.getParameter("uname");
        String msg = req.getParameter("msg");

        cmc.saveMeassage(recnme, sender, msg);
        
         resp.getWriter().write("Success...");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String recnme = req.getParameter("recnme");
        String sender = req.getParameter("uname");
        List<Individualchat> data = cmc.getAllMsgs(recnme, sender);

        JsonArray jr = new JsonArray();
        JsonObject jo;

        for (int i = 0; i < data.size(); i++) {
            Individualchat get = data.get(i);
            jo = new JsonObject();
            String username = get.getSenderUname();
            String rec = get.getReceiverUname();
            String content = get.getContent();
            Date dateTime = get.getCreatedTime();
            String date = dateTime.toString();

            jo.addProperty("username", username);
            jo.addProperty("receiver", rec);
            jo.addProperty("content", content);
            jo.addProperty("date", date);

            jr.add(jo);

        }
        resp.setContentType("text/json");
        resp.getWriter().write(jr.toString());

    }

}
