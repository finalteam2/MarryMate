package com.marry.notification.model;

import org.mybatis.spring.SqlSessionTemplate;

public class NotificationDAOImple implements NotificationDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

}
