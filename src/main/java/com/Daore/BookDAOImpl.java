
package com.Daore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection connection;

	public BookDAOImpl(Connection connection) {
		this.connection = connection; // Initialize connection
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean f = false;

		try {
			String sql = "INSERT INTO book_details(bookname, author, price, bookCategory, status, photo, user_email) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {

			String sql = "select * from book_details";
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public BookDtls getBooById(int id) {

		BookDtls b = null;

		try {
			String sql = "select * from book_details where bookId = ?";
			PreparedStatement ps = connection.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {

		}

		return b;
	}

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "update book_details set  bookname = ?, author=?, price=?,status=? where bookId=? ";
			PreparedStatement ps = connection.prepareStatement(sql);

			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {

			String sql = "delete from book_details where bookId= ? ";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details where bookCategory=?  and status=?   order by bookId DESC";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {

		}

		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details where status=?   order by bookId DESC";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {

		}

		return list;
	}

	@Override
	public List<BookDtls> getOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details where bookCategory=?  and status=?   order by bookId DESC";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {

		}

		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details where status=?   order by bookId DESC";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {

		}

		return list;

	}

	@Override
	public List<BookDtls> getAllNewBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details where bookCategory=?  and status=?   order by bookId DESC";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {

		}

		return list;
	}

	@Override
	public List<BookDtls> getAllOldBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_details where bookCategory=?  and status=?   order by bookId DESC";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();

				b.setBookId(rs.getInt(1));

				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {

		}

		return list;
	}

	@Override
	public List<BookDtls> getBookByOld(String email, String category) {
	    List<BookDtls> list = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM book_details WHERE bookCategory=? AND user_email=?";  
	        PreparedStatement ps = connection.prepareStatement(sql);
	        ps.setString(1, category);
	        ps.setString(2, email);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            BookDtls b = new BookDtls();
	            b.setBookId(rs.getInt("id")); 
	            b.setBookname(rs.getString("book_name"));
	            b.setAuthor(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setBookCategory(rs.getString("Old"));
	            b.setStatus(rs.getString("status"));
	            b.setPhotoName(rs.getString("photo"));
	            b.setEmail(rs.getString("user_email"));
	            list.add(b);
	        }

	        rs.close();
	        ps.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	@Override
	public List<BookDtls> getBookBySerch(String ch) {
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;

		try {
			String sql = "SELECT * FROM book_details WHERE (bookname LIKE ? OR author LIKE ? OR bookCategory LIKE ?) AND status=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
