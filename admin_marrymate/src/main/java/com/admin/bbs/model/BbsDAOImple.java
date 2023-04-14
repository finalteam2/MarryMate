package com.admin.bbs.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.admin.book.model.PaymentDTO;
import com.admin.notification.model.NotificationDTO;

public class BbsDAOImple implements BbsDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<BbsListDTO> bbsList(int cp, int listSize, String kind) {
		
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		
		if(kind.equals("공지사항")) {
			List<BbsListDTO> dtos=sqlMap.selectList("bbsList_g",map);
			return dtos;
		}else {
			List<BbsListDTO> dtos=sqlMap.selectList("bbsList_w",map);
			return dtos;
		}
			
		
	}
	
	@Override
	public List<BbsListDTO> bbsList_b(int cp, int listSize) {
		
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<BbsListDTO> dtos=sqlMap.selectList("bbsList_b",map);
		return dtos;
	}
	
	public int getTotalCnt_bbs(String kind) {
		Map map=new HashMap();
		map.put("kind", kind);
		
		int count=sqlMap.selectOne("getTotalCnt_bbs",map);
		count=count==0?1:count;
		return count;
	}
	
	public int getTotalCnt_bbs_b() {
		
		int count=sqlMap.selectOne("getTotalCnt_bbs_b");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public BbsDTO bbsInfo(int bidx) {
		BbsDTO dto=sqlMap.selectOne("bbsInfo",bidx);
		return dto;
	}
	
	@Override
	public int bi_bbs(int bidx) {
		int topfix=sqlMap.selectOne("bi_bbs",bidx);
		return topfix;
	}
	
	@Override
	public void sd_bbs(int bidx) {
		sqlMap.update("sd_bbs",bidx);
	}
	
	public void hj_bbs(int bidx) {
		sqlMap.update("hj_bbs",bidx);
	}
	
	@Override
	public List<BbsDTO> listSel_bidx(String kind, int bidx) {
		
		BbsDTO bbsDto=new BbsDTO();
		bbsDto.setKind(kind);
		bbsDto.setBidx(bidx);
		
		List<BbsDTO> dtos=sqlMap.selectList("listSel_bidx",bbsDto);
		return dtos;
	}
	
	@Override
	public List<BbsDTO> listSel_subject(int cp, int listSize, String kind, String selectText) {

		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		map.put("subject", selectText);
		
		List<BbsDTO> dtos=sqlMap.selectList("listSel_subject",map);
		return dtos;
	}
	
	@Override
	public List<BbsDTO> listSel_bidx_b(String kind, int bidx) {
		
		BbsDTO bbsDto=new BbsDTO();
		bbsDto.setKind(kind);
		bbsDto.setBidx(bidx);
		
		List<BbsDTO> dtos=sqlMap.selectList("listSel_bidx_b",bbsDto);
		return dtos;
	}
	
	@Override
	public List<BbsDTO> listSel_subject_b(int cp, int listSize, String kind, String selectText) {

		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		map.put("subject", selectText);
		
		List<BbsDTO> dtos=sqlMap.selectList("listSel_subject_b",map);
		return dtos;
	}
	
	
	@Override
	public int getTotalCnt_subject(String kind, String selectText) {
		
		Map map=new HashMap();
		map.put("kind", kind);
		map.put("subject", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_subject",map);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_subject_b(String kind, String selectText) {
		
		Map map=new HashMap();
		map.put("kind", kind);
		map.put("subject", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_subject_b",map);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public void bbs(String subject,String content) {
		
		BbsDTO bbsDto=new BbsDTO();
		bbsDto.setSubject(subject);
		bbsDto.setContent(content);
		
		sqlMap.insert("bbs",bbsDto);
	}
	
	@Override
	public BbsDTO bbsContent(int bidx) {
		
		BbsDTO dto=sqlMap.selectOne("bbsContent",bidx);
		return dto;
	}
	
	public void heajae(int bidx) {
		sqlMap.update("heajae",bidx);
	}
	
	public void ceolee(int bidx) {
		sqlMap.update("ceolee",bidx);
	}

}
