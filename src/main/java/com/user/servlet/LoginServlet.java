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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDaoImpl dao = new UserDaoImpl(DBConnect.getConnection());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Admin login
            if ("admin12@gmail.com".equals(email) && "admin".equals(password)) {
                User adminUser = new User();
                adminUser.setName("Admin");
              
                adminUser.setEmail(email);

                session.setAttribute("userobj", adminUser);
                resp.sendRedirect("admin/Home.jsp");
            } else {
                User user = dao.login(email, password);
                if (user != null) {
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("Index.jsp");
                } else {
                    session.setAttribute("failedMsg", "Invalid Email or Password");
                    resp.sendRedirect("login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
