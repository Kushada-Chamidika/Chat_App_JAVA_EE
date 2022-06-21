package servlets;

import controllers.checkEmailController;
import controllers.checkUsernameController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checkEmail extends HttpServlet {

     
    checkEmailController controller;
    
    public checkEmail(){
    controller = new checkEmailController();
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        
        boolean result = controller.isUser(email);

     
        if (result) {
             resp.getWriter().write("Already Exsists!");        
        } else {
            resp.getWriter().write("No User!");
        }


    }

  

}
