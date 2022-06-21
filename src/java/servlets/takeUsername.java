package servlets;

import POJOFiles.Users;
import controllers.takeUsernameController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class takeUsername extends HttpServlet {

    takeUsernameController tec;

    public takeUsername() {
        tec = new takeUsernameController();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("uid"));
        Users user = tec.getUsername(id);
        
        resp.getWriter().write(user.getUsername());

    }

}
