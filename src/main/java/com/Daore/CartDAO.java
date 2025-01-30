package com.Daore;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart>  getBookByUser(int userId);
	
	public boolean deleteBook(int bid , int uid, int cid);

	Cart getCartByUserAndBook(int userId, int bookId);

	
}
