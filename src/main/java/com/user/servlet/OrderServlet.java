package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DBConn.DBConnect;
import com.Daore.BookOrderImpl;
import com.Daore.CartDaoImpl;
import com.entity.Book_Order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

			CartDaoImpl dao = new CartDaoImpl(DBConnect.getConnection());
			List<Cart> blist = dao.getBookByUser(id);

			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");

				resp.sendRedirect("checkout.jsp");

			} else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConnection());
				List<Book_Order> orderList = new ArrayList<>();

				Random r = new Random();
				for (Cart c : blist) {
					Book_Order o = new Book_Order();
					o.setOrderId("BOOK-ORD-" + (r.nextInt(10000) + 1000)); // Unique Order ID
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(String.valueOf(c.getPrice())); // Convert price to String
					o.setPaymentType(paymentType);
					orderList.add(o);
				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean success = dao2.saveOrder(orderList);
					if (success) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Your Order Failed..");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}
	}
}
