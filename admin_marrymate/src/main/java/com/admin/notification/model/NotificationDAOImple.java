package com.admin.notification.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Integer> selCidx() {
		List<Integer> cidxs=sqlMap.selectList("selCidx");
		return cidxs;
	}
	@Override
	public void noti_com(int cidx, String recv, String title, String content) {
		Map map=new HashMap();
		map.put("cidx",cidx);
		map.put("recv",recv);
		map.put("title", title);
		map.put("content", content);
		
		sqlMap.insert("noti_com",map);
	}
	
	@Override
	public List<Integer> selMidx() {
		List<Integer> midxs=sqlMap.selectList("selMidx");
		return midxs;
	}
	@Override
	public void noti_mem(int midx, String recv, String title, String content) {
		Map map=new HashMap();
		map.put("midx",midx);
		map.put("recv",recv);
		map.put("title", title);
		map.put("content", content);
		
		sqlMap.insert("noti_mem",map);
	}
	
	

}
