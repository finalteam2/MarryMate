package com.marry.book.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.marry.company.model.CompanyDTO;
import com.marry.notification.model.NotificationDTO;
import com.marry.point.model.PointDTO;

public class BookDAOImple implements BookDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	/**통합예약내 업체리스트 출력(카테고리별)*/
	@Override
	public List<CompanyDTO> cateBookList(String filterCate) {
		List<CompanyDTO> list=sqlMap.selectList("cateList",filterCate);
		return list;
	}
	
	/**상품 카트에 추가*/
	@Override
	public CompanyDTO addBookCart(int cidx) {
		CompanyDTO dto=sqlMap.selectOne("addCart", cidx);
		return dto;
	}
	
	/**통합예약내 업체리스트 출력(조건 통합검색)*/
	@Override
	public List<CompanyDTO> searchBookList(FilterDTO dto) {
		List<CompanyDTO> list=sqlMap.selectList("searchList",dto);
		return list;
	}

	/**(notHall)예약,결제 데이터 넣고 pay_idx 추출+알림*/
	@Override
	public List<Integer> notHallPay(List<BookpayDTO> bookPayList) {
		
		List<Integer> bk_idx=new ArrayList<Integer>();
		
		for(int i=0;i<bookPayList.size();i++) {
			sqlMap.insert("notHallBookInfo", bookPayList.get(i));
			bk_idx.add(sqlMap.selectOne("notHallSelectBk_idx"));
			sqlMap.update("notHallUpdateBk_state");
		}
		
		Map map=new HashMap();
		
		for(int i=0;i<bk_idx.size();i++) {
			map.put("bk_idx", bk_idx.get(i));
			map.put("midx", bookPayList.get(i).getMidx());
			map.put("pay_point", bookPayList.get(i).getUsePoint());
			map.put("pay_money", bookPayList.get(i).getFinalPrice());			
			sqlMap.insert("notHallPayInfo", map);
		}
		
		NotificationDTO notiDto1=new NotificationDTO();
		NotificationDTO notiDto2=new NotificationDTO();
		
		for(int i=0;i<bk_idx.size();i++) {
			int cidx=Integer.parseInt(bookPayList.get(i).getCidx());
			notiDto1.setCidx(cidx);
			sqlMap.insert("comNoti", notiDto1);
			int midx=Integer.parseInt(bookPayList.get(0).getMidx());
			notiDto2.setMidx(midx);
			notiDto2.setNdate(bookPayList.get(i).getBk_date());
			sqlMap.insert("memNoti", notiDto2);
		}
		
		
	
		List<Integer> pay_idx=new ArrayList<Integer>();
		
		for(int i=0;i<bk_idx.size();i++) {
			pay_idx.add(sqlMap.selectOne("notHallSelectPay_idx", bk_idx.get(i)));
		}
		return pay_idx;
	}
	
	/**(hall)예약,결제 데이터 넣고 pay_idx 추출+알림*/
	@Override
	public List<Integer> hallPay(List<BookpayDTO> bookPayList) {
		List<Integer> bk_idx=new ArrayList<Integer>();
		
		sqlMap.insert("hallBookInfo", bookPayList.get(0));
		bk_idx.add(sqlMap.selectOne("hallSelectBk_idx"));
		sqlMap.update("hallUpdateBk_state");

		
		Map map=new HashMap();
		
		map.put("bk_idx", bk_idx.get(0));
		map.put("midx", bookPayList.get(0).getMidx());
		map.put("pay_point", bookPayList.get(0).getUsePoint());
		map.put("pay_money", bookPayList.get(0).getFinalPrice());
		sqlMap.insert("hallPayInfo", map);

		
		NotificationDTO notiDto1=new NotificationDTO();
		NotificationDTO notiDto2=new NotificationDTO();
        
		int cidx=Integer.parseInt(bookPayList.get(0).getCidx());
		notiDto1.setCidx(cidx);
		sqlMap.insert("comNoti", notiDto1);
		int midx=Integer.parseInt(bookPayList.get(0).getMidx());
		notiDto2.setMidx(midx);
		notiDto2.setNdate(bookPayList.get(0).getBk_date());
		sqlMap.insert("memNoti", notiDto2);
	
		
	
		List<Integer> pay_idx=new ArrayList<Integer>();
		
		pay_idx.add(sqlMap.selectOne("hallSelectPay_idx", bk_idx.get(0)));
			
		return pay_idx;
	}
	
	/**결제시 포인트내역 업데이트*/
	@Override
	public void pointUpdate(int midx, int usePoint, int pay_idx) {
		
		int point=sqlMap.selectOne("memPoint", midx);
		int p_total=point-usePoint;
		
		
		Map map=new HashMap();
		
		map.put("p_total", p_total);
		map.put("midx", midx);
		
		sqlMap.update("memPointUpdate", map);
		
		int calUsePoint=-usePoint;
		
		PointDTO pointDto=new PointDTO();
		pointDto.setMidx(midx);
		pointDto.setPay_idx(pay_idx);
		pointDto.setP_cal(calUsePoint);
		pointDto.setP_total(p_total);
		
		sqlMap.insert("memPointMinus", pointDto);
		
	}
	
	/**멤버 보유포인트 가져오기*/
	@Override
	public int memberPoint(int midx) {
		int point=sqlMap.selectOne("memPoint", midx);
		return point;
	}
	
	/**예약가능시간 출력*/
	@Override
	public List<String> bookTimeList(int cidx, String filterDate) {
		
		Map map=new HashMap();
		map.put("cidx", cidx);
		map.put("filterDate", filterDate);
		
		List<String> bookTimes=new ArrayList<String>();
		
		bookTimes=sqlMap.selectList("showBookTime", map);
		return bookTimes;
	}
	
	/**이미 예약한시간 출력 막기*/
	@Override
	public List<String> exceptTimeList(int cidx, String strFilterDate) {
		
		Map map=new HashMap();
		map.put("cidx", cidx);
		map.put("strFilterDate", strFilterDate);
		
		List<String> exceptTimes=new ArrayList<String>();
		
		exceptTimes=sqlMap.selectList("exceptBookTime", map);
		
		return exceptTimes;
	}
}
