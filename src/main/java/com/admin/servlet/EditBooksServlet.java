package com.admin.servlet;

import java.io.IOException;

import com.DBConn.DBConnect;
import com.Daore.BookDAOImpl;
import com.entity.BookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
				int id = Integer.parseInt(req.getParameter("id"));
			
				String bookName = req.getParameter("bookName");
	            String author = req.getParameter("authorName");
	            String price = req.getParameter("price");
	            String status = req.getParameter("status");
	            
	            BookDtls b = new BookDtls();
	            b.setBookId(id);
	            b.setBookname(bookName);
	            b.setAuthor(author);
	            b.setPrice(price);
	            b.setStatus(status);
	            
	            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	            boolean f = dao.updateEditBooks(b);
			
	            HttpSession session = req.getSession();
	            
	            if(f) {
	            	session.setAttribute("succMsg", "Book Update Successfully...");
	            	resp.sendRedirect("admin/all_books.jsp");
	            }
	            else {
	            	session.setAttribute("failedMsg", "Somthing Wrong On Server...");
	            	resp.sendRedirect("admin/all_books.jsp");
	            }
	            
		} catch (Exception e) {
			
		}
	}
}
