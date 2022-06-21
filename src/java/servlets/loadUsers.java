package servlets;

import POJOFiles.Users;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import controllers.loadUsersController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loadUsers extends HttpServlet {

    loadUsersController um;

    public loadUsers() {
        um = new loadUsersController();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            List<Users> userData = um.getAllUsers();

            JsonArray jr = new JsonArray();
            JsonObject jo;

            for (int i = 0; i < userData.size(); i++) {
                Users get = userData.get(i);
                jo = new JsonObject();
                jo.addProperty("idUser", get.getIdusers());
                jo.addProperty("name", get.getFullname());
                jo.addProperty("email", get.getEmail());
                jr.add(jo);
            }

            resp.setContentType("text/json");
            resp.getWriter().write(jr.toString());
        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String data = req.getParameter("text");

        try {
            List<Users> userData = um.getUserlike(data);

            JsonArray jr = new JsonArray();
            JsonObject jo;

            for (int i = 0; i < userData.size(); i++) {
                Users get = userData.get(i);
                jo = new JsonObject();
                jo.addProperty("idUser", get.getIdusers());
                jo.addProperty("name", get.getFullname());
                jo.addProperty("email", get.getEmail());
                jr.add(jo);
            }

            resp.setContentType("text/json");
            resp.getWriter().write(jr.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
