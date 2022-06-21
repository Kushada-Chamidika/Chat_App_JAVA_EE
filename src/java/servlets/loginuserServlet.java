package servlets;

import POJOFiles.Users;
import controllers.loginUser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

public class loginuserServlet extends HttpServlet {

    loginUser loguser;

    public loginuserServlet() {
        loguser = new loginUser();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Users user = loguser.userLogin(username, password);
        String id = String.valueOf(user.getIdusers());
        String fname = user.getFullname();
        String uname = user.getUsername();
        String email = user.getEmail();

        if (user.getIdusers() > 0) {

            HttpSession session = req.getSession();
            session.setAttribute("idUser", id);
            session.setAttribute("fullname", fname);
            session.setAttribute("username", uname);
            session.setAttribute("email", email);

            resp.getWriter().write("Success");
        } else {

            HttpSession session = req.getSession();
            session.setAttribute("idUser", -1);

            resp.getWriter().write("Error");
        }

    }

}
