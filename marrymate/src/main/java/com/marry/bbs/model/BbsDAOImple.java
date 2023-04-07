package com.marry.bbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int bbsWrite(BbsDTO dto) {
		return sqlMap.insert("bbsWrite", dto);
	}
	
	@Override
	public int replyWrite(ReplyDTO dto) {
		return sqlMap.insert("replyWrite", dto);
	}
	
	@Override
	public List<BbsDTO> bbsNotiList() {
		return sqlMap.selectList("bbsNotiList");
	}
	
	@Override
	public List<BbsDTO> bbsAfterList() {
		return sqlMap.selectList("bbsAfterList");
	}
	
	@Override
	public List<BbsDTO> bbsTalkList() {
		return sqlMap.selectList("bbsTalkList");
	}
	
	@Override
	public List<ReplyDTO> replyList(int bidx) {
		return sqlMap.selectList("replyList", bidx);
	}
	
	@Override
	public BbsDTO bbsContent(int bidx) {
		return sqlMap.selectOne("bbsContent", bidx);
	}
	
	@Override
	public int watchUp(int bidx) {
		return sqlMap.update("watchUp", bidx);
	}
	
	@Override
	public int bestCount(int bidx, int midx) {
		Map map=new HashMap<String, Integer>();
		map.put("bidx", bidx);
		map.put("midx", midx);
		return sqlMap.insert("bestCount", map);
	}
	
	@Override
	public int worstCount(int bidx, int midx) {
		Map map=new HashMap<String, Integer>();
		map.put("bidx", bidx);
		map.put("midx", midx);
		return sqlMap.insert("worstCount", map);
	}

}
