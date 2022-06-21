package servlets;

import controllers.checklogInController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checkLogIn extends HttpServlet {

    checklogInController clc;

    public checkLogIn() {
        clc = new checklogInController();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");

        boolean result = clc.chekUserStatus(username);

        if (result) {
            resp.getWriter().write("Error");
        } else {
            resp.getWriter().write("Success");
        }

    }

}
