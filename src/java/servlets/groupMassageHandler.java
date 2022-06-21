package servlets;

import POJOFiles.Groupchat;
import POJOFiles.Users;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import controllers.groupChatController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class groupMassageHandler extends HttpServlet {
    
    groupChatController cm;
    
    public groupMassageHandler() {
        cm = new groupChatController();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String username = req.getParameter("username");
        String message = req.getParameter("msg");
        
        cm.saveMeassage(username, message);
        
        resp.getWriter().write("Success...");
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        List<Groupchat> chat = cm.getAllMsgs();
        
        JsonArray jr = new JsonArray();
        JsonObject jo;
        
        for (int i = 0; i < chat.size(); i++) {
            Groupchat get = chat.get(i);
            jo = new JsonObject();
            String username = get.getUsername();
            String content = get.getContent();
            Date dateTime = get.getCratedTime();
            String date = dateTime.toString();
            
            jo.addProperty("username", username);
            jo.addProperty("content", content);
            jo.addProperty("date", date);
            
            jr.add(jo);
            
        }
        resp.setContentType("text/json");
        resp.getWriter().write(jr.toString());
        
    }
    
}
