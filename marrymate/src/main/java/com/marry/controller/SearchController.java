package com.marry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.CompanyDTO;
import com.marry.page.module.pageModule;
import com.marry.search.model.SearchDAOImple;
import com.marry.search.model.SearchDTO;

@Controller
public class SearchController {
	
	@Autowired
	private SearchDAOImple searchDao;
	
	/**예식장 검색 페이지*/
	@RequestMapping(value = "/searchHall.do", method = RequestMethod.GET)
	public ModelAndView searchHall() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/searchHall");
		mav.addObject("kind", "예식장");
		return mav;
	}

	public int stToInt(String st) {
		if (st.equals(null) || st.length() == 0) {
			return 0;
		}else {
			try {
				int num = Integer.parseInt(st);
				return num;
			} catch (Exception e) {
				return 0;
			}
		}
	}
	
	//예식장 내역 검색 json 반환
	@RequestMapping(value = "/searchHall.do", method = RequestMethod.POST)
	public ModelAndView searchHall(
			@RequestParam(name = "sido",defaultValue = "")String sido,
			@RequestParam(name = "sigungu",defaultValue = "")String sigungu,
			@RequestParam(name = "payMin",defaultValue = "0")String pMin,
			@RequestParam(name = "payMax",defaultValue = "0")String pMax,
			@RequestParam(name = "guestMin",defaultValue = "0")String gMin,
			@RequestParam(name = "guestMax",defaultValue = "0")String gMax,
			@RequestParam(name = "name",defaultValue = "")String name,
			@RequestParam(name = "sort",defaultValue = "")String sort,
			@RequestParam(name = "kind",defaultValue = "")String kind,
			@RequestParam(name = "view",defaultValue = "4")int view,
			@RequestParam(name = "page",defaultValue = "1")int page
			) {
		int payMin = stToInt(pMin);
		int payMax = stToInt(pMax);
		int guestMin = stToInt(gMin);
		int guestMax = stToInt(gMax);
		int start = (page - 1) * view + 1;
		int end = (page * view);
		SearchDTO dto = new SearchDTO(sido, sigungu, payMin, payMax, guestMin, guestMax, name, sort, kind, view, start, end);
		List<CompanyDTO> arr = searchDao.searchAll(dto);
		int cnt = searchDao.totalCnt(dto);
		String paging = "";
		if (cnt > 0) {
			paging = pageModule.makePage("searchHall", cnt, view, 5, page);
		}else {
			paging = "검색결과가 없습니다.";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("companylist", arr);
		mav.addObject("paging",paging);
		mav.addObject("cnt", cnt);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**기타 검색 페이지*/
	@RequestMapping("/searchEtc.do")
	public ModelAndView searchEtc() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/searchEtc");
		return mav;
	}
	
	//기타 검색 내용 json 반환
	@RequestMapping(value = "/searchEtc.do", method = RequestMethod.POST)
	public ModelAndView searchEtc(
			@RequestParam(name = "sido",defaultValue = "")String sido,
			@RequestParam(name = "payMin",defaultValue = "0")String pMin,
			@RequestParam(name = "payMax",defaultValue = "0")String pMax,
			@RequestParam(name = "name",defaultValue = "")String name,
			@RequestParam(name = "sort",defaultValue = "")String sort,
			@RequestParam(name = "kind",defaultValue = "")String kind,
			@RequestParam(name = "view",defaultValue = "4")int view,
			@RequestParam(name = "page",defaultValue = "1")int page
			) {
		int payMin = stToInt(pMin);
		int payMax = stToInt(pMax);
		int start = (page - 1) * view + 1;
		int end = (page * view);
		SearchDTO dto = new SearchDTO(sido, "", payMin, payMax, 0, 0, name, sort, kind, view, start, end);
		List<CompanyDTO> arr = searchDao.searchAll(dto);
		int cnt = searchDao.totalCnt(dto);
		String paging = "";
		if (cnt > 0) {
			paging = pageModule.makePage("searchEtc", cnt, view, 5, page);
		}else {
			paging = "검색결과가 없습니다.";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("companylist", arr);
		mav.addObject("paging",paging);
		mav.addObject("cnt", cnt);
		mav.setViewName("finalJson");
		return mav;
	}
	
	//즐겨찾기 한 항목 조회 json 반환
	@RequestMapping(value = "/searchLike.do", method = RequestMethod.POST)
	public ModelAndView likeList(
			@RequestParam(value="midx")int mdix
			) {
		ModelAndView mav = new ModelAndView();
		List<CompanyDTO> harr = searchDao.likeHall(mdix);
		List<CompanyDTO> sarr = searchDao.likeSdm(mdix);
		List<CompanyDTO> earr = searchDao.likeEtc(mdix);
		mav.addObject("harr", harr);
		mav.addObject("sarr", sarr);
		mav.addObject("earr", earr);
		mav.setViewName("finalJson");
		return mav;
	}
	
}
