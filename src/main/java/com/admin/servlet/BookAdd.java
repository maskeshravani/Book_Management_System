package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import com.DBConn.DBConnect;
import com.Daore.BookDAOImpl;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BookAdd extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        
            String bookName = req.getParameter("bookName");
            String author = req.getParameter("authorName");
            String price = req.getParameter("price");
            String category = req.getParameter("category");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

           

            BookDtls b = new BookDtls( 0, bookName, author, price, category, status, fileName, "admin");
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
            
           

            boolean f = dao.addBooks(b);
            HttpSession session = req.getSession();

            if (f) {
            	
            	 String path = getServletContext().getRealPath("")+"book";
                 System.out.println(path);
                 
                 File file = new File(path);
                 
                 part.write(path+File.separator + fileName);
            	
            	
                session.setAttribute("succMsg", "Book Added Successfully");
                resp.sendRedirect("admin/add_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server");
                resp.sendRedirect("admin/add_book.jsp");
            }

          
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error while adding book: " + e.getMessage());
        }
    }
}
