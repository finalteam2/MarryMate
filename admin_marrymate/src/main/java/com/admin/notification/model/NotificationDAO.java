package com.admin.notification.model;

import java.util.List;

public interface NotificationDAO {
	
	public void noti(int midx,String title,String content);
	
	public List<Integer> selCidx();
	
	public void noti_com(int cidx,String recv,String title,String content);
	
	public List<Integer> selMidx();
	
	public void noti_mem(int midx,String recv,String title,String content);

}
