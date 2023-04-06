package com.marry.notification.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class NotificationDAOImple implements NotificationDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int insertNoti(NotificationDTO dto) {
		int result = sqlMap.insert("insertNoti", dto);
		return result;
	}
	@Override
	public List<NotificationDTO> selectComNoti(int cidx) {
		List<NotificationDTO> arr = sqlMap.selectList("selectComNoti", cidx);
		return arr;
	}
	@Override
	public List<NotificationDTO> selectMemNoti(int midx) {
		List<NotificationDTO> arr = sqlMap.selectList("selectComNoti", midx);
		return arr;
	}
	@Override
	public int cntComNoti(int cidx) {
		int cnt = sqlMap.selectOne("cntComNoti", cidx);
		return cnt;
	}
	@Override
	public int cntMemNoti(int midx) {
		int cnt = sqlMap.selectOne("cntMemNoti", midx);
		return cnt;
	}
	@Override
	public int checkNoti(int nidx) {
		int cnt = sqlMap.update("checkNoti", nidx);
		return cnt;
	}
	
}
