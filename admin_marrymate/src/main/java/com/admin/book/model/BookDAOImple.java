package com.admin.book.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.admin.notification.model.NotificationDTO;

public class BookDAOImple implements BookDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<BookListDTO> bookList(int cp, int listSize, String kind) {
		
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		
		if(kind.equals("예식장")) {
			List<BookListDTO> dtos=sqlMap.selectList("bookList_h",map);
			return dtos;
		}else{
			map.put("kind", kind);
			
			List<BookListDTO> dtos=sqlMap.selectList("bookList",map);
			return dtos;
		}
		
	}
	
	@Override
	public List<BookListDTO> bookList_b(int cp, int listSize) {
		
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<BookListDTO> dtos=sqlMap.selectList("bookList_b",map);
		return dtos;
		
	}
	
	@Override
	public List<BookListDTO> listSel_bk_idx(String kind, int bk_idx) {
		
		Map map=new HashMap();
		map.put("bk_idx",bk_idx);
		
		if(kind.equals("예식장")) {
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_idx_h",map);
			return dtos;
		}else{
			map.put("kind", kind);
			
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_idx",map);
			return dtos;
		}
		
		
	}
	
	@Override
	public List<BookListDTO> listSel_bk_midx(String kind, int midx) {

		Map map=new HashMap();
		map.put("midx",midx);
		
		if(kind.equals("예식장")) {
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_midx_h",map);
			return dtos;
		}else{
			map.put("kind", kind);
			
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_midx",map);
			return dtos;
		}
		
		
	}
	
	@Override
	public List<BookListDTO> listSel_bk_name(int cp, int listSize, String kind, String selectText) {

		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("name", selectText);
		
		if(kind.equals("예식장")) {
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_name_h",map);
			return dtos;
		}else{
			map.put("kind", kind);
			
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_name",map);
			return dtos;
		}
	}
	
	@Override
	public List<BookListDTO> listSel_bk_cname(int cp, int listSize, String kind, String selectText) {

		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("cname", selectText);
		
		if(kind.equals("예식장")) {
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_cname_h",map);
			return dtos;
		}else{
			map.put("kind", kind);
			
			List<BookListDTO> dtos=sqlMap.selectList("listSel_bk_cname",map);
			return dtos;
		}
		
		
	}
	
	@Override
	public int getTotalCnt_bk(String kind) {
		
		if(kind.equals("예식장")) {
			int count=sqlMap.selectOne("getTotalCnt_bk_h");
			count=count==0?1:count;
			return count;
		}else{
			int count=sqlMap.selectOne("getTotalCnt_bk",kind);
			count=count==0?1:count;
			return count;
		}
		
		
	}
	
	@Override
	public int getTotalCnt_bk_n(String kind, String selectText) {
		Map map=new HashMap();
		map.put("name", selectText);
		
		if(kind.equals("예식장")) {
			int count=sqlMap.selectOne("getTotalCnt_bk_n_h",map);
			count=count==0?1:count;
			return count;
		}else{
			map.put("kind", kind);
			
			int count=sqlMap.selectOne("getTotalCnt_bk_n",map);
			count=count==0?1:count;
			return count;
		}
	}
	
	@Override
	public int getTotalCnt_bk_cn(String kind, String selectText) {
		Map map=new HashMap();
		map.put("cname", selectText);
		
		if(kind.equals("예식장")) {
			int count=sqlMap.selectOne("getTotalCnt_bk_cn_h",map);
			count=count==0?1:count;
			return count;
		}else{
			map.put("kind", kind);
			
			int count=sqlMap.selectOne("getTotalCnt_bk_cn",map);
			count=count==0?1:count;
			return count;
		}
	}
	
	@Override
	public int getTotalCnt_bk_b() {
		
		int count=sqlMap.selectOne("getTotalCnt_bk_b");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public BookDetailsDTO bookDetails(int bk_idx,String kind) {
		Map map=new HashMap();
		map.put("bk_idx", bk_idx);
		
		if(kind.equals("예식장")) {
			BookDetailsDTO dto=sqlMap.selectOne("bookDetails_h",map);
			return dto;
		}else{
			map.put("kind", kind);
			
			BookDetailsDTO dto=sqlMap.selectOne("bookDetails",map);
			return dto;
		}
	}
	
	@Override
	public String pay_date(int bk_idx) {

		int cb=sqlMap.selectOne("countBook",bk_idx);
		
		String pay_date="";
		if(cb>1) {
			pay_date=sqlMap.selectOne("pay_date_2",bk_idx);
		}else {
			pay_date=sqlMap.selectOne("pay_date_1",bk_idx);
		}
		
		return pay_date;
	}
	
	@Override
	public void cancle(int bk_idx,int midx) {
  		
  		int count=sqlMap.selectOne("selectCount",bk_idx);
  		
  		if(count==1) {
  			
  			sqlMap.update("updateBook",bk_idx);
  			
  			int cidx=sqlMap.selectOne("selectCidx",bk_idx);
  			
  			PaymentDTO payDto=sqlMap.selectOne("selectPay",bk_idx);
  			
  			sqlMap.insert("insertRefund",payDto);
  			
  			int refund_idx=sqlMap.selectOne("selectRefund_idx",payDto.getPay_idx());
  			
  			int point=sqlMap.selectOne("selectPoint",midx);
  			
  			Map map=new HashMap();
  			int p_total=point+payDto.getPay_point();
  			map.put("p_total",p_total);
  			map.put("midx",midx);
  			
  			sqlMap.update("updateMember",map);

  			Map map2=new HashMap();
  			map2.put("midx",midx);
  			map2.put("refund_idx",refund_idx);
  			map2.put("pay_point",payDto.getPay_point());
  			map2.put("p_total",p_total);
  			
  			sqlMap.insert("insertPoint",map2);
  			
  			NotificationDTO notiDto=new NotificationDTO();
  			notiDto.setCidx(cidx);
  			notiDto.setMidx(midx);
  			notiDto.setTitle("예약취소 안내");
  			notiDto.setContent("예약번호:"+bk_idx+"번이 취소되었습니다.");
  			
  			sqlMap.insert("insertNotiCom",notiDto);
  			
  			sqlMap.insert("insertNotiMem",notiDto);
  			
  		}else if(count==2) {
  
  		}
  		
	}
}
