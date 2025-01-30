package com.entityRe;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.DBConn.DBConnect;
import com.Daore.UserDaoImpl;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Handle POST requests (e.g., process registration data)
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String phono = request.getParameter("pNo");
            String password = request.getParameter("pass");
            String check = request.getParameter("check");

            if (name == null || email == null || phono == null || password == null || check == null) {
                response.getWriter().write("All fields are required.");
                return;
            }

            // Create User object and set values
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phono);
            us.setPassword(password);

            // Attempt to register user
         //   UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
         //   boolean f = dao.userRegister(us);

            HttpSession session = request.getSession();
            if(check!=null) {
            	UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
            	
            	boolean f2 = dao.checkUser(email);
            	if(f2) {
            		boolean f = dao.userRegister(us);
                	
                	
                    if (f) {
                       // response.getWriter().write("User registered successfully.");
                    	session.setAttribute("sussMsg", "Registertion Successully..");
                    	response.sendRedirect("register.jsp");
                    	
                    } else {
                       // response.getWriter().write("Something went wrong on the server.");
                    	session.setAttribute("failedMsg", "Somthing  wrong on server..");
                    	response.sendRedirect("register.jsp");
                    
                    }
            		
            	}else {
            		session.setAttribute("failedMsg", "User Already Exist Try  Another Email Id..");
                	response.sendRedirect("register.jsp");
            	}
            	
            }else  {
            	session.setAttribute("failedMsg", "..");
            	response.sendRedirect("register.jsp");
            }
            
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during registration", e);
            response.getWriter().write("An error occurred. Please try again later.");
        }
    }
}
