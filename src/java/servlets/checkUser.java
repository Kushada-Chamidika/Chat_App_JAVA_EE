package servlets;

import controllers.checkUsernameController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checkUser extends HttpServlet {
    
    checkUsernameController controller;
    
    public checkUser(){
    controller = new checkUsernameController();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        
        boolean result = controller.isUser(username);

      
        if (result) {
             resp.getWriter().write("Already Exsists!");        
        } else {
            resp.getWriter().write("No User!");
        }

    }

    
    
}
