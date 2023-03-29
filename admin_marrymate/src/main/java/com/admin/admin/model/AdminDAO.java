package com.admin.admin.model;

import javax.servlet.http.HttpSession;

public interface AdminDAO {
	
	final public static int NOT_ID=1;
	final public static int NOT_PWD=2;
	final public static int LOGIN_OK=3;
	final public static int ERROR=-1;
	
	public int loginCheck(String id, String pwd, HttpSession session);
	
	public AdminDTO getInfo(String id);

}
