package com.Daore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.entityRe.User;

public class UserDaoImpl implements UserDao {
    private Connection conn;

    public UserDaoImpl(Connection conn) {
        this.conn = conn;
    }
    public boolean userRegister(User us) {
        boolean f = false;
        PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO register(name, email, pNo, pass) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the PreparedStatement to avoid resource leaks
            try {
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return f;
    }


    @Override
    public User login(String email, String password) {
        User us = null;
        try {
            String sql = "SELECT * FROM register WHERE email = ? AND pass = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new User();
               
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                us.setPassword(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

	

    @Override
    public boolean checkPassword(int id, String password) {
        boolean f = false;

        try {
            String sql = "SELECT * FROM register WHERE id = ? AND pass = ?";
            
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }

        return f;
    }


    @Override
    public boolean updateProfile(User us) {
        boolean f = false;

        try {
            String sql = "UPDATE register SET name = ?, email = ?, pNo = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setInt(4, us.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }

        return f;
    }
	@Override
	public boolean checkUser(String em) {
		boolean f = true;
		 try {
	            String sql = "select * from register where email = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, em);
	           
	          ResultSet rs = ps.executeQuery();
	          
	          while(rs.next()) {
	        	  f = false;
	        	  
	          }
	            
	        } catch (Exception e) {
	            e.printStackTrace(); // Log the exception
	        }

	        return f;
	}



	

	}
    
    

