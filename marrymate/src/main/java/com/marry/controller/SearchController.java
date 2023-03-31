package com.marry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.CompanyDTO;
import com.marry.page.module.pageModule;
import com.marry.search.model.SearchDAOImple;
import com.marry.search.model.SearchDTO;

@Controller
public class SearchController {
	
	@Autowired
	SearchDAOImple searchDAO;
	
	/**웨딩홀 검색 페이지*/
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
	
	@RequestMapping(value = "/searchHall.do", method = RequestMethod.POST)
	public ModelAndView searchHall(
			@RequestParam(name = "sido",defaultValue = "전국")String sido,
			@RequestParam(name = "sigungu",defaultValue = "시군구")String sigungu,
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
		//dto.toString();
		//System.out.println("page : " + page);
		List<CompanyDTO> arr = searchDAO.searchAll(dto);
		int cnt = searchDAO.totalCnt(dto);
		String paging = pageModule.makePage("searchHall", cnt, view, 5, page);
		//System.out.println(paging);
		
		String json = "{\"cnt\":\"" + cnt + "\",\"paging\":\"" + paging + "\",\"companylist\":[";
		for(int i = 0; i < arr.size(); i++) {
			json += "{";
			//json += "\"cidx\":\"" + arr.get(i).getCidx() + "\",";
			//json += "\"joindate\":\"" + arr.get(i).getJoindate() + "\",";
			json += "\"kind\":\"" + arr.get(i).getKind() + "\",";
			json += "\"cname\":\"" + arr.get(i).getCname() + "\",";
			//json += "\"intro\":\"" + arr.get(i).getIntro() + "\",";
			//json += "\"id\":\"" + arr.get(i).getId() + "\",";
			//json += "\"pwd\":\"" + arr.get(i).getPwd() + "\",";
			//json += "\"tel\":\"" + arr.get(i).getTel() + "\",";
			//json += "\"email\":\"" + arr.get(i).getEmail() + "\",";
			//json += "\"juso\":\"" + arr.get(i).getJuso() + "\",";
			//json += "\"sjuso\":\"" + arr.get(i).getSjuso() + "\",";
			//json += "\"curl\":\"" + arr.get(i).getCurl() + "\",";
			json += "\"sido\":\"" + arr.get(i).getSido() + "\",";
			json += "\"sigungu\":\"" + arr.get(i).getSigungu() + "\",";
			json += "\"pay\":\"" + arr.get(i).getPay() + "\",";
			json += "\"guest_num\":\"" + arr.get(i).getGuest_num() + "\",";
			//json += "\"cnum\":\"" + arr.get(i).getCnum() + "\",";
			//json += "\"cfile\":\"" + arr.get(i).getCfile() + "\",";
			//json += "\"clevel\":\"" + arr.get(i).getClevel() + "\",";
			//json += "\"blind\":\"" + arr.get(i).getBlind() + "\",";
			//json += "\"watch\":\"" + arr.get(i).getWatch() + "\",";
			//json += "\"joindate\":\"" + arr.get(i).getJoindate() + "\",";
			//json += "\"topfix\":\"" + arr.get(i).getTopfix() + "\",";
			json += "\"img\":\"" + arr.get(i).getImg() + "\"";
			json += "}";
			if(i+1 != arr.size()) {
				json += ",";
			}
		}
		json += "]}";
		//System.out.println(json);
		ModelAndView mav = new ModelAndView();
		mav.addObject("json", json);
		mav.setViewName("search/result");
		return mav;
	}
	
	/**기타 검색 페이지*/
	@RequestMapping("/searchEtc.do")
	public ModelAndView searchEtc() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/searchEtc");
		return mav;
	}
	
	@RequestMapping(value = "/searchEtc.do", method = RequestMethod.POST)
	public ModelAndView searchEtc(
			@RequestParam(name = "sido",defaultValue = "전국")String sido,
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
		SearchDTO dto = new SearchDTO(sido, "시군구", payMin, payMax, 0, 0, name, sort, kind, view, start, end);

//		dto.toString();
//		System.out.println("page : " + page);
		
		List<CompanyDTO> arr = searchDAO.searchAll(dto);
		int cnt = searchDAO.totalCnt(dto);
		String paging = pageModule.makePage("searchEtc", cnt, view, 5, page);
		ModelAndView mav = new ModelAndView();
		
//		System.out.println(paging);
		
		String json = "{\"cnt\":\"" + cnt + "\",\"paging\":\"" + paging + "\",\"companylist\":[";
		for(int i = 0; i < arr.size(); i++) {
			json += "{";
			json += "\"kind\":\"" + arr.get(i).getKind() + "\",";
			json += "\"cname\":\"" + arr.get(i).getCname() + "\",";
			json += "\"sido\":\"" + arr.get(i).getSido() + "\",";
			json += "\"pay\":\"" + arr.get(i).getPay() + "\",";
			json += "\"topfix\":\"" + arr.get(i).getTopfix() + "\"";
			json += "}";
			if(i+1 != arr.size()) {
				json += ",";
			}
		}
		json += "]}";
		
//		System.out.println(json);
		
		mav.addObject("json", json);
		mav.setViewName("search/result");
		return mav;
	}
	
}
