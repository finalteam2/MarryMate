package com.admin.notification.model;

public interface NotificationDAO {
	
	public void noti(int midx,String title,String content);
	
	public void noti_all(String recv,String title,String content);

}
