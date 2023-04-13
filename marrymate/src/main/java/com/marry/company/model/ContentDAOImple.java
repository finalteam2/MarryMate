package com.marry.company.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

import com.marry.book.model.BookDTO;
import com.marry.book.model.BookListDTO;
import com.marry.point.model.PointDTO;

public class ContentDAOImple implements ContentDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public CompanyDTO companySelectOne(int cidx) {
		CompanyDTO dto = sqlMap.selectOne("companySelectOne", cidx);
		return dto;
	}
	
	@Override
	public List<HallDTO> selectHall(int cidx) {
		List<HallDTO> arr = sqlMap.selectList("selectHall", cidx);
		return arr;
	}
	
	@Override
	public List<FoodDTO> selectFood(int cidx) {
		List<FoodDTO> arr = sqlMap.selectList("selectFood", cidx);
		return arr;
	}
	
	@Override
	public List<Com_ImgDTO> selectCom_Img(int cidx) {
		List<Com_ImgDTO> arr = sqlMap.selectList("selectImg", cidx);
		return arr;
	}

	@Override
	public int insertReview(ReviewDTO dto) {
		int result = sqlMap.insert("insertReview", dto);
		return result;
	}
	
	@Override
	public List<ReviewDTO> selectReview(int cidx) {
		List<ReviewDTO> arr = sqlMap.selectList("selectReview", cidx);
		return arr;
	}
	
	@Override
	public Com_LikeDTO selectCom_Like(Com_LikeDTO dto) {
		Com_LikeDTO result = sqlMap.selectOne("selectLike", dto);
		return result;
	}

	@Override
	public int insertCom_Like(Com_LikeDTO dto) {
		int result = sqlMap.insert("insertLike", dto);
		return result;
	}
	
	@Override
	public int deleteCom_Like(Com_LikeDTO dto) {
		int result = sqlMap.delete("deleteLike", dto);
		return result;
	}
	
	@Override
	public int insertCom_cs(Com_CsDTO dto) {
		int result = sqlMap.insert("insertcomcs", dto);
		return result;
	}

	@Override
	public List<Com_CsDTO> selectComCs(int cidx) {
		List<Com_CsDTO> arr = sqlMap.selectList("selectcomcs", cidx);
		return arr;
	}
	
	@Override
	public List<Com_CsDTO> selectMemCs(int midx) {
		List<Com_CsDTO> arr = sqlMap.selectList("selectmemcs", midx);
		return arr;
	}
	
	@Override
	public int updateComCs(Com_CsDTO dto) {
		int result = sqlMap.update("updatecomcs", dto);
		return result;
	}
	
	@Override
	public List<Com_CsDTO> answeredCs(int cidx) {
		List<Com_CsDTO> arr = sqlMap.selectList("answeredcs", cidx);
		return arr;
	}
	
	@Override
	public List<BookListDTO> selectComBook(int cidx) {
		List<BookListDTO> arr = sqlMap.selectList("selectcombook", cidx);
		return arr;
	}
	@Override
	public List<BookListDTO> selectMemBook(int midx) {
		List<BookListDTO> arr = sqlMap.selectList("selectmembook", midx);
		return arr;
	}
	
	@Override
	public List<PointDTO> selectpoint(int midx) {
		List<PointDTO> arr = sqlMap.selectList("selectpoint", midx);
		return arr;
	}
	
	@Override
	public int updateWatch(int cidx) {
		int result = sqlMap.update("updatewatch", cidx);
		return result;
	}
	@Override
	public int insertHall(HallDTO dto) {
		int result = sqlMap.insert("inserthall", dto);
		return result;
	}
	@Override
	public int insertFood(FoodDTO dto) {
		int result = sqlMap.insert("insertfood", dto);
		return result;
	}
	@Override
	public int deleteHall(int hidx) {
		int result = sqlMap.insert("deletehall", hidx);
		return result;
	}
	@Override
	public int deletefood(int fidx) {
		int result = sqlMap.insert("deletefood", fidx);
		return result;
	}
	
	@Override
	public int refundRequest(int bk_idx) {
		int result = sqlMap.update("refundRequest", bk_idx);
		return result;
	}
	@Override
	public List<Book_TimeDTO> selectBookTime(Book_TimeDTO dto) {
		List<Book_TimeDTO> arr = sqlMap.selectList("selectBookTime", dto);
		return arr;
	}
	@Override
	public int checkBook(int cidx, int hidx, String date, String time) {
		Map<String, Object> map =  new HashMap<String, Object>();
		map.put("cidx", cidx);
		map.put("hidx", hidx);
		map.put("date", date);
		map.put("time", time);
		int result = sqlMap.selectOne("checkBook", map);
		return result;
	}
}
