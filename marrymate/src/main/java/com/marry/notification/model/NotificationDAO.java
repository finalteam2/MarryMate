package com.marry.notification.model;

import java.util.List;

public interface NotificationDAO {
	public int insertNoti(NotificationDTO dto);
	public List<NotificationDTO> selectComNoti(int cidx);
	public List<NotificationDTO> selectMemNoti(int midx);
	public int cntComNoti(int cidx);
	public int cntMemNoti(int midx);
	public int checkNoti(int nidx);
}
