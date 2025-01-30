package com.user.servlet;

import java.io.IOException;

import com.DBConn.DBConnect;
import com.Daore.BookDAOImpl;
import com.Daore.CartDaoImpl;
import com.entity.BookDtls;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        String bidParam = req.getParameter("bid");
	        String uidParam = req.getParameter("uid");
	        System.out.println(uidParam);

	        if (bidParam == null || uidParam == null) {
	            throw new IllegalArgumentException("Missing bid or uid parameter");
	        }

	        int bid = Integer.parseInt(bidParam);
	        int uid = Integer.parseInt(uidParam);

	        CartDaoImpl dao2 = new CartDaoImpl(DBConnect.getConnection());
	        Cart existingCart = dao2.getCartByUserAndBook(uid, bid);

	        HttpSession session = req.getSession();

	        if (existingCart != null) {
	            session.setAttribute("alreadyExists", "This book is already in your cart.");
	        } else {
	            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	            BookDtls b = dao.getBooById(bid);

	            if (b == null) {
	                throw new Exception("Book not found with ID: " + bid);
	            }

	            Cart c = new Cart();
	            c.setBid(bid);
	            c.setUserId(uid);
	            c.setBookName(b.getBookname());
	            c.setAuthor(b.getAuthor());
	            c.setPrice(Double.parseDouble(b.getPrice()));
	            c.setTotalPrice(Double.parseDouble(b.getPrice()));

	            boolean success = dao2.addCart(c);

	            if (success) {
	                session.setAttribute("addCart", "Book added to cart successfully!");
	            } else {
	                session.setAttribute("failed", "Failed to add book to cart.");
	            }
	        }

	        resp.sendRedirect("all_new_book.jsp");

	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID or user ID format.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
	    }
	}

	}

