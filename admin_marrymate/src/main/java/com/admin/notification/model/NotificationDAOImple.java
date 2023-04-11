package com.admin.notification.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.admin.company.model.CompanyDTO;

public class NotificationDAOImple implements NotificationDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public void noti(int midx, String title, String content) {
		
		NotificationDTO notiDto=new NotificationDTO();
		notiDto.setMidx(midx);
		notiDto.setTitle(title);
		notiDto.setContent(content);
		
		sqlMap.insert("noti",notiDto);
		
	}
	
	@Override
	public void noti_all(String recv, String title, String content) {

		NotificationDTO notiDto=new NotificationDTO();
		notiDto.setRecv(recv);
		notiDto.setTitle(title);
		notiDto.setContent(content);
		
		sqlMap.insert("noti_all",notiDto);
		
	}
	
	

}
