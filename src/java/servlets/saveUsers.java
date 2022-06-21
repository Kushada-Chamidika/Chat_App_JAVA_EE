package servlets;

import controllers.saveUsersController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class saveUsers extends HttpServlet {
    
    saveUsersController suc;
    
    public saveUsers() {
        suc = new saveUsersController();
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String fullname = req.getParameter("fname");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        boolean result = suc.saveUsers(fullname, email, username, password);

        if(result){           
        resp.getWriter().write("Success");
        }
        else{
        resp.getWriter().write("Error");
        }
        
        
    }
    
}
