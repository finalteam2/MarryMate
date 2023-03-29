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
import com.marry.search.model.SearchDAOImple;
import com.marry.search.model.SearchDTO;

@Controller
public class SearchController {
	
	@Autowired
	SearchDAOImple searchDAO;
	
	/**웨딩홀 검색 페이지*/
	@RequestMapping(value = "/searchHall.do", method = RequestMethod.GET)
	public ModelAndView searchHall() {
		SearchDTO dto = new SearchDTO();
		List<CompanyDTO> arr = searchDAO.searchAll(dto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("arr", arr);
		mav.setViewName("search/searchHall");
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
			@RequestParam(name = "sido",defaultValue = "")String sido,
			@RequestParam(name = "sigungu",defaultValue = "")String sigungu,
			@RequestParam(name = "hallType",required = false)String[] hallType,
			@RequestParam(name = "foodMin",defaultValue = "")String fMin,
			@RequestParam(name = "foodMax",defaultValue = "")String fMax,
			@RequestParam(name = "guestMin",defaultValue = "")String gMin,
			@RequestParam(name = "guestMax",defaultValue = "")String gMax,
			@RequestParam(name = "name",defaultValue = "강남예식장")String name,
			@RequestParam(name = "sort",defaultValue = "name")String sort,
			@RequestParam(name = "view",defaultValue = "5")int view
			) {
		int foodMin = stToInt(fMin);
		int foodMax = stToInt(fMax);
		int guestMin = stToInt(gMin);
		int guestMax = stToInt(gMax);
		SearchDTO dto = new SearchDTO(sido, sigungu, hallType, foodMin, foodMax, guestMin, guestMax, name, sort, view);
		dto.toString();
		List<CompanyDTO> arr = searchDAO.searchAll(dto);
		String msg = "{\"companylist\":[";
		for(int i = 0; i < arr.size(); i++) {
			msg += "{";
			msg += "\"cidx\":\"" + arr.get(i).getCidx() + "\",";
			msg += "\"kind\":\"" + arr.get(i).getKind() + "\",";
			msg += "\"cname\":\"" + arr.get(i).getCname() + "\",";
			msg += "\"intro\":\"" + arr.get(i).getIntro() + "\",";
			msg += "\"id\":\"" + arr.get(i).getId() + "\",";
			msg += "\"pwd\":\"" + arr.get(i).getPwd() + "\",";
			msg += "\"tel\":\"" + arr.get(i).getTel() + "\",";
			msg += "\"email\":\"" + arr.get(i).getEmail() + "\",";
			msg += "\"juso\":\"" + arr.get(i).getJuso() + "\",";
			msg += "\"sjuso\":\"" + arr.get(i).getSjuso() + "\",";
			msg += "\"pay\":\"" + arr.get(i).getPay() + "\",";
			msg += "\"cnum\":\"" + arr.get(i).getCnum() + "\",";
			msg += "\"cfile\":\"" + arr.get(i).getCfile() + "\",";
			msg += "\"clevel\":\"" + arr.get(i).getClevel() + "\",";
			msg += "\"blind\":\"" + arr.get(i).getBlind() + "\",";
			msg += "\"watch\":\"" + arr.get(i).getWatch() + "\"";
			msg += "}";
			if(i+1 != arr.size()) {
				msg += ",";
			}
		}
		msg += "]}";
		System.out.println(msg);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
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
	
	
}
