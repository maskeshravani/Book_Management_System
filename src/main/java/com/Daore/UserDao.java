package com.Daore;

import com.entityRe.User;

public interface UserDao {
    boolean userRegister(User us);
    
    public User login(String email, String password);
    


	boolean checkPassword(int id, String password);
    
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
}
