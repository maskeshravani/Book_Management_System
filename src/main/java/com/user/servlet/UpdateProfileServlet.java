package com.user.servlet;

import java.io.IOException;

import com.DBConn.DBConnect;
import com.Daore.UserDaoImpl;
import com.entityRe.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			 String name = req.getParameter("fname");
	            String email = req.getParameter("email");
	            String phono = req.getParameter("pNo");
	            String password = req.getParameter("pass");
	            String check = req.getParameter("check");
	            
	            User us = new User();
	            us.setId(id);
	            us.setName(name);
	            us.setEmail(email);
	            us.setPhno(phono);
	            
	            HttpSession session = req.getSession();
	            
	            UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
	            boolean f = dao.checkPassword(id, password);
	            if (f) {
	                boolean f2 = dao.updateProfile(us);
	                if (f2) {
	                    session.setAttribute("succMsg", "User Profile Updated Successfully.");
	                    resp.sendRedirect("edit_profile.jsp");
	                } else {
	                    session.setAttribute("failedMsg", "Something Went Wrong on Server.");
	                    resp.sendRedirect("edit_profile.jsp");
	                }
	            } else {
	                session.setAttribute("failedMsg", "Your Password is Incorrect.");
	                resp.sendRedirect("edit_profile.jsp");
	            }

	            
		} catch (Exception e) {
			
		}
	}
}
